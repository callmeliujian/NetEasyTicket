//
//  LJTabBar.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJTabBar;
@protocol LJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LJTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface LJTabBar : UIView

//模型数组（UITabBarItem）
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<LJTabBarDelegate> delegate;

@end
