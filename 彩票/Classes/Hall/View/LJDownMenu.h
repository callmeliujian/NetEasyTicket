//
//  LJDownMenu.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJDownMenu : UIView

//items(LJMenuItem)
//@property (nonatomic, strong) NSArray *items;

+ (instancetype)showInView:(UIView *)view items:(NSArray *)items oriY:(CGFloat)oriY;

- (void)hide;

@end
