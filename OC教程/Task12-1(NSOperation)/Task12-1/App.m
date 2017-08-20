//
//  App.m
//  Task12-1
//
//  Created by 🍋 on 2017/2/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "App.h"

@implementation App

-(instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary*)dict {
    return [[App alloc]initWithDict:dict];
}

@end
