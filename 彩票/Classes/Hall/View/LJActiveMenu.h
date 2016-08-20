//
//  LJActiveMenu.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJActiveMenu;

@protocol LJActiveMenuDelegate <NSObject>

@optional

- (void)activeMenudidClickCloseBtn:(LJActiveMenu *)menu;

@end

@interface LJActiveMenu : UIView

@property (nonatomic, weak) id<LJActiveMenuDelegate> delegate;

+ (instancetype)activeMenu;

+ (instancetype)showInPoint:(CGPoint)point;

+ (void)hideInPoint:(CGPoint)point completion:(void(^)())completion;

@end
