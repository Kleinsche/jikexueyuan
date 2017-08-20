//
//  ViewController.m
//  计算器
//
//  Created by 🍋 on 16/7/15.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextField *input2;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)calBtn:(UIButton *)sender {
    NSString*strInput1 = self.input1.text;
    NSString*strInput2 = self.input2.text;
    
    if ([strInput1 isEqual:@""] || [strInput2 isEqual:@""]) {
        self.result.text=@"请输入数字";
    }else
    {
    float floatResult = 0;
    switch (sender.tag) {
        case 1:
            floatResult = [strInput1 floatValue] + [strInput2 floatValue];
            self.result.text = [NSString stringWithFormat:@"%0.2f",floatResult];
            break;
            case 2:
             floatResult = [strInput1 floatValue] - [strInput2 floatValue];
            self.result.text = [NSString stringWithFormat:@"%0.2f",floatResult];
            break;
            case 3:
             floatResult = [strInput1 floatValue] * [strInput2 floatValue];
            self.result.text = [NSString stringWithFormat:@"%0.2f",floatResult];
            break;
            case 4:
            if ([strInput2  isEqual:@"0"]) {
                self.result.text = @"除数不能为0";
            }else{
                floatResult = [strInput1 floatValue] / [strInput2 floatValue];
                self.result.text = [NSString stringWithFormat:@"%0.2f",floatResult];
            }
    }
    
}
}



@end
