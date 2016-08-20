//
//  LJSettingCell.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJSettingCell.h"
#import "LJArrowSettingItem.h"
#import "LJSwitchSettingItem.h"

@interface LJSettingCell ()

@property (nonatomic, strong) UIImageView *arrowView;

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation LJSettingCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
        
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

+ (instancetype)cellWithTebleView:(UITableView *)tableView
{
    
    static NSString *ID = @"cell";
    
     LJSettingCell*cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell =  [[LJSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
    
}

- (void)setItem:(LJSettingItem *)item
{
    _item = item;
    
    //设置控件上的内容
    [self setUpData];
    
    //设置辅助视图
    [self setUpAccessoryView];

}

- (void)setUpData
{
    
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = _item.image;
    
}

- (void)setUpAccessoryView
{
    
    if ([_item isKindOfClass:[LJArrowSettingItem class]]) {
        //箭头
        self.accessoryView = self.arrowView;
    }else if([_item isKindOfClass:[LJSwitchSettingItem class]]){
        //开关
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        //还原
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
    
}

@end
