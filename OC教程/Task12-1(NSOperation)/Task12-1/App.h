//
//  App.h
//  Task12-1
//
//  Created by 🍋 on 2017/2/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* download;
@property(nonatomic,copy)NSString* icon;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)appWithDict:(NSDictionary*)dict;
@end
