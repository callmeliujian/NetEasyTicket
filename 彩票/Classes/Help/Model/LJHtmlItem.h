//
//  LJHtmlItem.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJHtmlItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *ID;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end
