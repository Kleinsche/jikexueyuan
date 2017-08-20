//
//  ViewController.m
//  Task7-3
//
//  Created by 🍋 on 16/8/4.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"

#import "ScrollView.h"

@interface ViewController ()

@property (strong, nonatomic) ScrollView * scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[ScrollView alloc]initWithFrame:self.view.bounds WithPageRect:CGRectMake(20.f, self.view.bounds.size.height - 50.f, self.view.bounds.size.width - 40.f, 20.f) WithView:self.view];
    
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < kCount; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg",i]];
        
        [array addObject:image];
    }
    self.scrollView.arrImages = array;
    self.scrollView.showTime = 2;
    
    [self.scrollView setView] ;
    [self.scrollView setPageControl];
    
}


@end
