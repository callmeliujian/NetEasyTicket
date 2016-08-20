//
//  LJLuckyViewController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJLuckyViewController.h"

@interface LJLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightView;

@end

@implementation LJLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *imag1 = [UIImage imageNamed:@"lucky_entry_light1"];
    _lightView.animationImages = @[image,imag1];
    _lightView.animationDuration = 1;
    [_lightView startAnimating];
    
}

@end
