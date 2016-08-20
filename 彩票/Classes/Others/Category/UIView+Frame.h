//
//  UIView+Frame.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//@property在分类里只会生成get，set方法的声明，不会生成成员属性，也不会实现。
@property (nonatomic ,assign) CGFloat height;
@property (nonatomic ,assign) CGFloat width;
@property (nonatomic ,assign) CGFloat x;
@property (nonatomic ,assign) CGFloat y;

@property (nonatomic ,assign) CGFloat centerX;
@property (nonatomic ,assign) CGFloat centerY;

@end
