//
//  LJMenuItem.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJMenuItem.h"

@implementation LJMenuItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    LJMenuItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}

@end
