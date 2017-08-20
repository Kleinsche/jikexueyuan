//
//  AppsTableViewController.m
//  Task12-1
//
//  Created by 🍋 on 2017/2/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

//#import "AppsTableViewController.h"
//
//@interface AppsTableViewController ()
//
//@end
//
//@implementation AppsTableViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#import "AppsTableViewController.h"
#import "App.h"
#import "DownloadOperation.h"

@interface AppsTableViewController ()<DownloadOperationDelegate>
//应用信息集合
@property(nonatomic,strong) NSMutableArray *apps;
//存放所有下载图片的队列
@property(nonatomic,strong) NSOperationQueue *queue;
//存放所有的下载操作（url是key，operation对象是value）
@property(nonatomic,strong) NSMutableDictionary *operations;
//存放所有下载完的图片
@property(nonatomic,strong) NSMutableDictionary *images;

@end

@implementation AppsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/**
 * 懒加载
 **/
-(NSMutableArray *)apps{
    if (!_apps) {
        NSMutableArray *appArr = [NSMutableArray array];
        NSString *file =[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:file];
        for (NSDictionary *dict in dictArr) {
            App *app = [App appWithDict:dict];
            [appArr addObject:app];
        }
        _apps = appArr;
    }
    return _apps;
}

-(NSOperationQueue *)queue{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

-(NSMutableDictionary *)operations{
    if (!_operations) {
        _operations = [[NSMutableDictionary alloc]init];
    }
    return _operations;
}

-(NSMutableDictionary *)images{
    if (!_images) {
        _images = [[NSMutableDictionary alloc]init];
    }
    return _images;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    App *app = self.apps[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    // 先从images缓存中取出图片url对应的UIImage
    UIImage *image = self.images[app.icon];
    if (image) {// 说明图片已经下载成功过（成功缓存）
        cell.imageView.image = image;
    }else{
        // 获得caches的路径, 拼接文件路径
        NSString *file = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[app.icon lastPathComponent]];
        
        // 先从沙盒中取出图片
        NSData *data = [NSData dataWithContentsOfFile:file];
        if (data) {//沙盒中存在图片
            cell.imageView.image = [UIImage imageWithData:data];
        }else{//沙盒不存，进行下载操作
            //显示占位图片
            cell.imageView.image = [UIImage imageNamed:@"placeholder"];
            // 下载图片
            [self download:app.icon indexPath:indexPath];
            
        }
        
    }
    
    return cell;
}

-(void)download:(NSString *)imageUrl indexPath:(NSIndexPath *)indexPath{
    //取出当前图片url对应下的下载操作（operations对象）
    DownloadOperation *operation = self.operations[imageUrl];
    if (operation)  return; //如果存在操作就不往下执行（因为可能该图片下载操作正在进行）
    
    //创建操作，下载图片
    operation = [[DownloadOperation alloc]init];
    operation.imageUrl = imageUrl;
    operation.indexPath = indexPath;
    
    //设置代理
    operation.delegate = self;
    
    // 添加操作到队列中
    [self.queue addOperation:operation];
    
    // 添加到字典中 (这句代码为了解决重复下载)
    self.operations[imageUrl] = operation;
    
}


/**
 *  当用户开始拖拽表格时调用
 */
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //暂停下载
    [self.queue setSuspended:YES];
}

/**
 *  当用户停止拖拽表格时调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //开始下载
    [self.queue setSuspended:NO];
}

#pragma mark - 下载操作的代理方法
-(void)downloadOperation:(DownloadOperation *)operation didFinishDownload:(UIImage *)image{
    // 存放图片到字典中
    if (image) {
        //存放所有的下载操作
        self.operations[operation.imageUrl] = image;
        
        //将图片存入沙盒中
        NSData *data = UIImagePNGRepresentation(image);
        NSString *file = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:[operation.imageUrl lastPathComponent]];
        [data writeToFile:file atomically:YES];
    }
    
    // 从字典中移除下载操作 (防止operations越来越大，保证下载失败后，能重新下载)
    [self.operations removeObjectForKey:operation.imageUrl];
    
    // 刷新表格
    [self.tableView reloadRowsAtIndexPaths:@[operation.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}
@end
