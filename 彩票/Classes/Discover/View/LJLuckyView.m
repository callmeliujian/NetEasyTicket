//
//  LJLuckyView.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJLuckyView.h"

@implementation LJLuckyView

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
}

@end
