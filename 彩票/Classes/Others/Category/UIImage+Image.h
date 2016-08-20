//
//  UIImage+Image.h
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

//返回最原始的图片
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName;

//拉伸图片
+ (instancetype)imageWithStretchableImageName:(NSString *)imageName;

@end
