//
//  LJHallViewController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJHallViewController.h"
#import "LJCover.h"
#import "LJActiveMenu.h"
#import "LJDownMenu.h"
#import "LJMenuItem.h"

@interface LJHallViewController ()<LJActiveMenuDelegate>

@property (nonatomic, strong) LJDownMenu *downMenu;

@property (nonatomic, assign) BOOL isPopMenu;

@end

@implementation LJHallViewController

- (LJDownMenu *)downMenu
{
    if (_downMenu == nil) {
        
        LJMenuItem *item = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        LJMenuItem *item1 = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        LJMenuItem *item2 = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        LJMenuItem *item3 = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        LJMenuItem *item4 = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        LJMenuItem *item5 = [LJMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        
        NSArray *items = @[item,item1,item2,item3,item4,item5];
        
        // 弹出黑色菜单
        _downMenu = [LJDownMenu showInView:self.view items:items oriY:0];
        
    }
    return _downMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(active)];
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMenu)];
    
}

#pragma mark - 点击菜单
- (void)popMenu
{
    if (_isPopMenu == NO) {
        
        [self downMenu];
        
    }else{
        // 隐藏菜单
        [self.downMenu hide];
        
    }
    
    _isPopMenu = !_isPopMenu;
    
    
}

#pragma mark - 点击活动
- (void)active
{
    //弹出蒙板
    [LJCover show];
    
    //弹出活动菜单
    LJActiveMenu *menu = [LJActiveMenu showInPoint:self.view.center];
    menu.delegate = self;
    
}

#pragma mark - LJActiveMenuDelegate代理方法
//点击活动菜单的关闭按钮的时候调用
- (void)activeMenudidClickCloseBtn:(LJActiveMenu *)menu
{
    [LJActiveMenu hideInPoint:CGPointMake(44, 44) completion:^{
        [LJCover hide];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
