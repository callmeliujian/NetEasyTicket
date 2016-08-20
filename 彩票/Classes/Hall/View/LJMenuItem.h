//
//  LJMenuItem.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LJMenuItem : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
