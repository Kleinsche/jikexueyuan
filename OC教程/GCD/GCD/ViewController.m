//
//  ViewController.m
//  GCD
//
//  Created by 🍋 on 2017/2/19.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self sync];
    
}

#pragma 异步函数
- (void)async {
#pragma 主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
        NSLog(@"主队列所在线程一%@",[NSThread currentThread]);
    });//number = 1
    
#pragma 全局并行队列
    dispatch_queue_t concurentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurentQueue, ^{
        NSLog(@"全局并行队列线程一%@",[NSThread currentThread]);
    });//number = 3
    dispatch_async(concurentQueue, ^{
        NSLog(@"全局并行队列线程二%@",[NSThread currentThread]);
    });//number = 4
    
#pragma 自定义串行队列
    dispatch_queue_t serQueue = dispatch_queue_create("创建串行队列", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serQueue, ^{
        NSLog(@"自定义串行队列线程一%@",[NSThread currentThread]);
    });//number = 5
    dispatch_async(serQueue, ^{
        NSLog(@"自定义串行队列线程二%@",[NSThread currentThread]);
    });//number = 5
    
#pragma 自定义并行队列
    dispatch_queue_t conQueue = dispatch_queue_create("创建并行队列", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(conQueue, ^{
        NSLog(@"自定义并行队列线程一%@",[NSThread currentThread]);
    });//number = 6
    dispatch_async(conQueue, ^{
        NSLog(@"自定义并行队列线程二%@",[NSThread currentThread]);
    });//number = 7
}

#pragma 同步函数(都在主队列执行)
- (void)sync {
#pragma 主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        NSLog(@"主队列所在线程%@",[NSThread currentThread]);//死锁
    });
    
#pragma 全局并行队列
    dispatch_queue_t concurentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(concurentQueue, ^{
        NSLog(@"全局并行队列线程一%@",[NSThread currentThread]);
    });//number = 1
    dispatch_sync(concurentQueue, ^{
        NSLog(@"全局并行队列线程二%@",[NSThread currentThread]);
    });//number = 1
    
#pragma 自定义串行队列
    dispatch_queue_t serQueue = dispatch_queue_create("创建串行队列", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serQueue, ^{
        NSLog(@"自定义串行队列线程一%@",[NSThread currentThread]);
    });//number = 1
    dispatch_sync(serQueue, ^{
        NSLog(@"自定义串行队列线程二%@",[NSThread currentThread]);
    });//number = 1
    
#pragma 自定义并行队列
    dispatch_queue_t conQueue = dispatch_queue_create("创建并行队列", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(conQueue, ^{
        NSLog(@"自定义并行队列线程一%@",[NSThread currentThread]);
    });//number = 1
    dispatch_sync(conQueue, ^{
        NSLog(@"自定义并行队列线程二%@",[NSThread currentThread]);
    });//number = 1

}
@end
