//
//  LJDownMenu.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJDownMenu.h"
#import "LJMenuItem.h"

#define LJCols 3
#define  LJItemWH LJScreenW / LJCols

@interface LJDownMenu ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation LJDownMenu

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}


+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY
{
    NSUInteger count = items.count;
    
    
    NSUInteger rows = (count - 1) / LJCols + 1;
    CGFloat menuH = rows * LJItemWH;
    
    
    // 高度 =》 当前总行数 =》 当前有多少个按钮 =》 rows = (count - 1) / cols + 1
    LJDownMenu *menu = [[LJDownMenu alloc] initWithFrame:CGRectMake(0, oriY, LJScreenW, menuH)];
    
    menu.items = items;
    
    // 添加按钮
    [menu setUpAllBtns];
    
    // 添加分割线
    [menu setUpAllDivideView];
    
    // 添加黑色的view
    UIView *blackView = [[UIView alloc] initWithFrame:menu.frame];
    
    blackView.backgroundColor = [UIColor blackColor];
    
    [superView addSubview:blackView];
    
#warning 动画
    // 往下移动的动画
    menu.transform = CGAffineTransformMakeTranslation(0, -menu.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        menu.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [blackView removeFromSuperview];
    }];
    
    
    menu.backgroundColor = [UIColor blackColor];
    
    [superView addSubview:menu];
    
    return menu;
}



- (void)hide
{
    
        
        [self removeFromSuperview];
        
    
}

#pragma mark - 添加分割线
- (void)setUpAllDivideView
{
    // x = (i + 1) * itemWH
    // Y = 0
    // w = 1
    // h = menu.h
    // 竖:总列数 - 1
    for (int i = 0; i < LJCols - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake((i + 1) * LJItemWH, 0, 1, self.height);
        
        [self addSubview:divideV];
    }
    NSUInteger rows = (self.items.count - 1) / LJCols + 1;
    
    // 横:总行数-1
    // x = 0 y = （i + 1） * itemWh w:menu.w h 1
    for (int i = 0; i < rows - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake(0, (i + 1) * LJItemWH, self.width, 1);
        
        [self addSubview:divideV];
    }
    
}

#pragma mark - 添加所有按钮
- (void)setUpAllBtns
{
    for (LJMenuItem *item in self.items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        
        [btn setImage:item.image forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        [self.btns addObject:btn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局所有的按钮
    NSUInteger count = self.items.count;
    
    
    int col = 0;
    NSUInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        col = i % LJCols;
        row = i / LJCols;
        
        UIButton *btn = self.btns[i];
        x = col * LJItemWH;
        y = row * LJItemWH;
        
        btn.frame = CGRectMake(x, y, LJItemWH, LJItemWH);
        
    }
}
@end
