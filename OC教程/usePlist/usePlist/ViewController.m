//
//  ViewController.m
//  usePlist
//
//  Created by 🍋 on 16/7/17.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"
#import "studentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取路径
    NSString *strPath = [[NSBundle mainBundle]pathForResource:@"student.plist" ofType:nil];
    
    //2.读取文件
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
    
    //3.解析数据
    for (NSDictionary *dict in arr) {
        //解析字典
//        NSString*name = [dict objectForKey:@"name_"];
//        NSLog(name,nil);
//        
//        NSString*sex = dict[@"sex_"];
//        NSLog(sex,nil);
//        
//        NSString*age = dict[@"age_"];
//        NSLog(@"%@",age);
        
        studentModel *model = [studentModel studentModelWithDict:dict];
        NSLog(model.name,nil);
        NSLog(model.sex,nil);
        NSLog(@"%d",model.age);
    }
}



@end
