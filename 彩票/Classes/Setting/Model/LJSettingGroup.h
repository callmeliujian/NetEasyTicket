//
//  LJSettingGroup.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJSettingGroup : NSObject

//items(LJSettingItem)
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSString *headTitle;

@property (nonatomic, strong) NSString *footTitle;

+ (instancetype)groupWithItems:(NSArray *)items;

@end
