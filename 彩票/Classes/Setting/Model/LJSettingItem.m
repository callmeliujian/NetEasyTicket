//
//  LJSettingItem.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJSettingItem.h"

@implementation LJSettingItem

+ (instancetype)itemWithImage:(UIImage *)image :(NSString *)title
{
    LJSettingItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}

@end
