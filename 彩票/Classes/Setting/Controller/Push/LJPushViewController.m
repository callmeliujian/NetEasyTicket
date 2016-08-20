//
//  LJPushViewController.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJPushViewController.h"
#import "LJArrowSettingItem.h"
#import "LJSettingGroup.h"
#import "LJSettingCell.h"
#import "LJScoreViewController.h"

@interface LJPushViewController ()

@end

@implementation LJPushViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup1];
}

- (void)setUpGroup1
{
    LJArrowSettingItem *item1 = [LJArrowSettingItem itemWithImage:nil :@"开奖推送和提醒"];
    
    item1.descVc = [LJPushViewController class];
    
    LJArrowSettingItem *item2 = [LJArrowSettingItem itemWithImage:nil :@"比分直播"];
    
    item2.descVc = [LJScoreViewController class];
    
    LJArrowSettingItem *item3 = [LJArrowSettingItem itemWithImage:nil :@"使用兑换码"];
    LJArrowSettingItem *item4 = [LJArrowSettingItem itemWithImage:nil :@"使用兑换码"];
    LJArrowSettingItem *item5 = [LJArrowSettingItem itemWithImage:nil :@"使用兑换码"];
    
    LJSettingGroup *group = [LJSettingGroup groupWithItems:@[item1, item2, item3, item4, item5]];
    
    [self.groups addObject:group];
    
}

@end
