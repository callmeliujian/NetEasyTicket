//
//  NSObject+Model.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>

@implementation NSObject (Model)

+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict
{
    id objc = [[self alloc] init];
    
    //遍历模型中的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        //属性名称
        NSString *ivarName = @(ivar_getName(ivar));
        
        ivarName = [ivarName substringFromIndex:1];
        
        id value = dict[ivarName];
        
        if (value == nil) {
            if (mapDict) {
                NSString *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        
        [objc setValue:value forKey:ivarName];

    }
    return objc;
}

@end
