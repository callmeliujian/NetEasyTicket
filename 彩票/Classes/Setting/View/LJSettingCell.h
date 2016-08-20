//
//  LJSettingCell.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJSettingItem;

@interface LJSettingCell : UITableViewCell

+ (instancetype)cellWithTebleView:(UITableView *)tableView;

@property (nonatomic, strong) LJSettingItem *item;

@end
