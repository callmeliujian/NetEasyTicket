//
//  LJGuideTool.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//  选择跟控制器

#import "LJGuideTool.h"
#import "LJSaveTool.h"
#import "LJTabBarController.h"
#import "LJNewFeatureViewController.h"

@implementation LJGuideTool

+ (UIViewController *)chooseRootViewController
{
    
    //判断有没有最新版本号
    //获取用户最新的版本号 info.plist
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    //获取上一次的版本号
    NSString *oldVersion = [LJSaveTool objectForKey:LJVersionKey];
    UIViewController *rootVc = nil;
    
    if ([curVersion isEqualToString:oldVersion]) {
        //没有最新版本
        //创建根控制器
        rootVc = [[LJTabBarController alloc] init];
    }else{
        //有最新版本，进入新特性，保存最新版本号
        rootVc = [[LJNewFeatureViewController alloc]init];
        
        [LJSaveTool setObject:curVersion forKey:LJVersionKey];
        
    }

    return rootVc;
}

@end
