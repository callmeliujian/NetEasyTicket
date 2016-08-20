//
//  LJActiveMenu.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJActiveMenu.h"
#import "LJCover.h"

@implementation LJActiveMenu

- (IBAction)close:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(activeMenudidClickCloseBtn:)]) {
        [_delegate activeMenudidClickCloseBtn:self];
    }
    
     
}
+ (instancetype)activeMenu
{
    return [[NSBundle mainBundle] loadNibNamed:@"LJActiveMenu" owner:nil options:nil][0];
}

#pragma  mark - 显示菜单
+ (instancetype)showInPoint:(CGPoint)point
{
    //创建活动菜单
    LJActiveMenu *menu = [LJActiveMenu activeMenu];
    menu.center = point;
    [LJKeyWindow addSubview:menu];
    
    return menu;
}

#pragma  mark - 隐藏菜单

+ (void)hideInPoint:(CGPoint)point completion:(void (^)())completion
{
    
    void(^completion1)() = ^{
        if ((completion)) {
            completion();
        }
    };
    
    for (LJActiveMenu *childView in LJKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            
            [childView setUpHideAnim:point completion:completion1];
            
        }
    }
}

#pragma mark - 隐藏动画
- (void)setUpHideAnim:(CGPoint)point completion:(void (^)())completion
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformTranslate(transform, -self.center.x + point.x, -self.center.y + point.y);
        transform = CGAffineTransformScale(transform, 0.001, 0.001);
        self.transform = transform;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

@end
