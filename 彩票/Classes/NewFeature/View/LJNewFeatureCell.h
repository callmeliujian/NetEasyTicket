//
//  LJNewFeatureCell.h
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount;

@end
