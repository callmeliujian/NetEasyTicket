//
//  LJNewFeatureCell.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJNewFeatureCell.h"
#import "LJTabBarController.h"

@interface LJNewFeatureCell()

@property (nonatomic ,weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *startButton;

@end

@implementation LJNewFeatureCell

- (UIButton *)startButton
{
    if (_startButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [btn sizeToFit];
        
        btn.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton = btn;
        
        [self addSubview:btn];
    }
    return _startButton;
}


- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount
{
    if (indexPath.row == pagesCount - 1) {
        // 最后一行
        // 添加立即体验按钮
        
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
    
}

//点击立即体验按钮
- (void)start
{
    //切换根控制器
    LJKeyWindow.rootViewController = [[LJTabBarController alloc] init];
    
    //转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"cube";
    [LJKeyWindow.layer addAnimation:anim forKey:nil];
}

@end
