//
//  LJSettingItem.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJSettingItem : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subTitle;

//保存每一行cell的功能
@property (nonatomic, strong) void(^itemOpertion)();


+ (instancetype)itemWithImage:(UIImage *)image :(NSString *)title;

@end
