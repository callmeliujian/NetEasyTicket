//
//  LJCover.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJCover.h"
#import "LJActiveMenu.h"


@implementation LJCover

+ (void)show
{
    //创建蒙板对象
    LJCover *cover = [[LJCover alloc] initWithFrame:LJScreenBounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    
    //把蒙板对象添加到主窗口
    [LJKeyWindow addSubview:cover];
}

+ (void)hide
{
    for (UIView *childView in LJKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            [childView removeFromSuperview];
        }
    }
}

@end