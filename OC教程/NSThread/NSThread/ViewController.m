//
//  ViewController.m
//  NSThread
//
//  Created by 🍋 on 2017/2/18.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"main...%@",[NSThread currentThread]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread * thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
//    NSLog(@"主线程优先级%f",[NSThread mainThread].threadPriority);
//    NSLog(@"thread1优先级%f",thread1.threadPriority);
    
    [thread1 start];
    thread1.name = @"thread1";
    thread1.threadPriority = 0.1;//优先级
    
//    NSThread * thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
////    NSLog(@"thread2优先级%f",thread2.threadPriority);
//    [thread2 start];
//    thread2.name = @"thread2";
//    thread2.threadPriority = 0.9;
    
//#pragma 方法2
//    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
//    
//#pragma 方法3
//    [self performSelectorInBackground:@selector(run) withObject:nil];
}


-(void)run {
//        NSLog(@"%@",[NSThread currentThread]);
    NSURL *url = [[NSURL alloc]initWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487426588439&di=63208f6ad2fdd32b27e945e482cbed5e&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg"];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:NO];
}

-(void)showImage:(UIImage*)image {
    self.image.image = image;
}

@end
