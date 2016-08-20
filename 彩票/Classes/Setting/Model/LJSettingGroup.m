//
//  LJSettingGroup.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJSettingGroup.h"

@implementation LJSettingGroup

+ (instancetype)groupWithItems:(NSArray *)items
{
    LJSettingGroup *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}

@end
