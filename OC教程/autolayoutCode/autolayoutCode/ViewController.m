//
//  ViewController.m
//  autolayoutCode
//
//  Created by 🍋 on 16/7/22.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UIView
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueView];
    
    //禁用autoresizing功能
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *arrH = [NSLayoutConstraint
                     constraintsWithVisualFormat:@"H:|-20-[redView]-20-[greenView(==redView)]-20-|"
                     options: NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom
                     metrics:nil
                     views:NSDictionaryOfVariableBindings(redView,greenView)];
    [self.view addConstraints:arrH];
    
    NSArray*arrV = [NSLayoutConstraint
                    constraintsWithVisualFormat:@"V:|-40-[redView(200)]-|"
                    options:0
                    metrics:nil
                    views:NSDictionaryOfVariableBindings(redView)];
    [self.view addConstraints:arrV];
    
    NSArray*blueH = [NSLayoutConstraint
                     constraintsWithVisualFormat:@"H:|-0-[blue]"
                     options:0
                     metrics:nil
                     views:@{@"blue":blueView}];
    [redView addConstraints:blueH];
    
    NSArray*blueV = [NSLayoutConstraint
                     constraintsWithVisualFormat:@"V:|-0-[blueView(100)]"
                     options:0
                     metrics:nil
                     views:NSDictionaryOfVariableBindings(blueView)];
    [redView addConstraints:blueV];
    
    NSLayoutConstraint *blueWidth = [NSLayoutConstraint
                                     constraintWithItem:blueView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:redView
                                     attribute:NSLayoutAttributeWidth
                                     multiplier:0.5
                                     constant:0];
    [redView addConstraint:blueWidth];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
