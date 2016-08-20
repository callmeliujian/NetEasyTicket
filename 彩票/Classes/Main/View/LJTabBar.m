//
//  LJTabBar.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJTabBar.h"
#import "LJTabBarButton.h"

@interface LJTabBar()

@property (nonatomic, weak)LJTabBarButton *selButton;

@end

@implementation LJTabBar

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items) {
        UIButton *btn = [LJTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.tag = self.subviews.count;
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        
        //默认选中第一个
        if (self.subviews.count == 1) {
            [self btnClick:btn];
        }
    }
}

- (void)btnClick:(LJTabBarButton *)button
{
    _selButton.selected = NO;
    button.selected = YES;
    _selButton = button;
    
    //通知TabBarVC切换控制器
    //封装控件使用代理
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat h = self.height;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        
    }
}

@end
