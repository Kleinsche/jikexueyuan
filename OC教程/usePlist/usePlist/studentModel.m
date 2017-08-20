//
//  studentModel.m
//  usePlist
//
//  Created by 🍋 on 16/7/17.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "studentModel.h"

@implementation studentModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    //父类初始化
    self = [super init];
    //子类初始化
    if (self) {
        self.name = [dict objectForKey:@"name_"];
        self.sex = dict[@"sex_"];
        self.age = [dict[@"age_"]intValue];
    }
    return self;
}

+(instancetype)studentModelWithDict:(NSDictionary*)dict{
    return [[studentModel alloc]initWithDict:dict];
}

@end
