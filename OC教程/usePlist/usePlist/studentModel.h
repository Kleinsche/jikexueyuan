//
//  studentModel.h
//  usePlist
//
//  Created by 🍋 on 16/7/17.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentModel : NSObject

//姓名
@property(nonatomic,copy)NSString*name;

//性别
@property(nonatomic,copy)NSString*sex;

//年龄
@property(nonatomic,assign)int age;

//成员函数
-(instancetype)initWithDict:(NSDictionary*)dict;

//类方法
+(instancetype)studentModelWithDict:(NSDictionary*)dict;

@end
