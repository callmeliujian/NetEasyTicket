//
//  LJHtmlItem.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJHtmlItem.h"

@implementation LJHtmlItem

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    LJHtmlItem *item = [LJHtmlItem objcWithDict:dict mapDict:@{@"ID":@"id"}];;
    
    
    
    return item;
    
}

@end
