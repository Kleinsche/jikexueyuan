//
//  ViewController.m
//  Task7-3
//
//  Created by 🍋 on 16/8/4.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView : UIScrollView

#define kCount 5
#define kWidth frame.size.width
#define kHeight frame.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//图片数组
@property (nonatomic, copy) NSMutableArray *arrImages;

//间隔时间
@property (nonatomic, assign) CGFloat showTime;

//设置PageControl
-(void)setPageControl;

//计时器
-(void)setView;

//初始化
- (instancetype)initWithFrame:(CGRect)frame WithPageRect:(CGRect)pageRect WithView:(UIView *)superView;

@end
