//
//  DownloadOperation.m
//  Task12-1
//
//  Created by 🍋 on 2017/2/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "DownloadOperation.h"
#import <UIKit/UIKit.h>

@implementation DownloadOperation

-(void)main{
    @autoreleasepool {//管理内存
        if (self.isCancelled)  return;  //暂停为执行的操作
        
        NSURL *url = [NSURL URLWithString:self.imageUrl];
        NSData *data = [NSData dataWithContentsOfURL:url]; // 下载
        UIImage *image = [UIImage imageWithData:data]; // NSData -> UIImage
        
        if(self.isCancelled) return;//暂停正在执行的操作
        
        // 回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if ([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownload:)]) {
                [self.delegate downloadOperation:self didFinishDownload:image];
            }
        }];
    }
}

@end
