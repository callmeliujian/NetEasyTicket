//
//  LJGroupBuyViewController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJGroupBuyViewController.h"
#import "LJTitleView.h"

@interface LJGroupBuyViewController ()

@property (nonatomic, weak) UIButton *titleView;

@end

@implementation LJGroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条titleView
    UIButton *titleView = [LJTitleView buttonWithType:UIButtonTypeCustom];
    _titleView = titleView;
    [titleView setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    [titleView setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [titleView sizeToFit];
    
    self.navigationItem.titleView = titleView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"助手" style:UIBarButtonItemStyleBordered target:self action:@selector(help)];
    
}

- (void)help
{
    //给系统方法添加功能，重写该方法
    [_titleView setTitle:@"全部彩种全部彩种" forState:UIControlStateNormal];
}

@end