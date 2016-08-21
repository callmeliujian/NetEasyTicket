//
//  NSObject+Model.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

//字典转模型
//mapDict:模型中的属性名跟字典里面的key对应
+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
