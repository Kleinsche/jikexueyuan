//
//  DownloadOperation.h
//  Task12-1
//
//  Created by 🍋 on 2017/2/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DownloadOperation;
//协议
@protocol DownloadOperationDelegate <NSObject>
@optional
- (void)downloadOperation:(DownloadOperation *)operation didFinishDownload:(UIImage *)image;
@end

@interface DownloadOperation : NSOperation
//下载图片地址
@property(nonatomic,copy) NSString *imageUrl;
//表格cell位置
@property(nonatomic,strong) NSIndexPath *indexPath;
//代理
@property(nonatomic,weak) id<DownloadOperationDelegate> delegate;


@end
