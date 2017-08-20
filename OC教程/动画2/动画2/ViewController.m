//
//  ViewController.m
//  动画2
//
//  Created by 🍋 on 16/7/30.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [UIView animateKeyframesWithDuration:10 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        //添加关键帧
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.3 animations:^{
//            self.redView.transform = CGAffineTransformTranslate(self.redView.transform, 100, 0);
//        }];
//        
//        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:1 animations:^{
//            self.redView.frame = CGRectMake(200, 400, 100, 100);
//        }];
//        
//    } completion:^(BOOL finished) {
//        self.redView.frame = CGRectMake(0, 0, 50, 50);
//    }];
    
    
//    //块动画
//    [UIView animateWithDuration:1 delay:0
//         usingSpringWithDamping:0.1
//          initialSpringVelocity:5
//         options:UIViewAnimationOptionTransitionCurlUp
//               animations:^{
//              self.redView.transform = CGAffineTransformTranslate(self.redView.transform, 5, 5);
//          } completion:^(BOOL finished) {
//              
//          }];
    

    
    
    
    
//    [UIView beginAnimations:nil context:nil];
//    
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.redView cache:YES];
//    [UIView setAnimationDuration:1];
//    [UIView setAnimationRepeatAutoreverses:YES];
//    
//    [UIView commitAnimations];
}

@end
