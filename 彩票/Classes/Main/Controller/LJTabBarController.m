//
//  LJTabBarController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJTabBarController.h"
#import "LJHallViewController.h"
#import "LJArenaViewController.h"
#import "LJDiscoverViewController.h"
#import "LJHistoryViewController.h"
#import "LJMyLotteryViewController.h"
#import "LJNavigationController.h"
#import "LJArenaNavController.h"
#import "LJTabBar.h"

@interface LJTabBarController ()<LJTabBarDelegate>

//保存所有控制器对应按钮的内容（UITabBar）
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation LJTabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //添加子控制器
    [self setUpAllChildViewController];
    
    //自定义tabBar
    [self setUpTabBar];
    
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    //移除系统的tabBar
    //把一个控件移除父控件不会马上销毁，一般在下一次运行循环的时候，会判断这个对象有没有强引用，如果没有才会被销毁。
    //[self.tabBar removeFromSuperview];
    
    LJTabBar *tabBar = [[LJTabBar alloc] init];
    
    tabBar.items = self.items;
    
    tabBar.delegate = self;
   
    tabBar.backgroundColor = [UIColor blackColor];
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 去掉系统tabBar上的按钮
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[LJTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

#pragma mark - LJTabBarDelegate方法
//监听tabBar上按钮点击
- (void)tabBar:(LJTabBar *)tabBar didClickBtn:(NSInteger)index
{
    self.selectedIndex = index;
}

#pragma mark - 添加子控制器
- (void)setUpAllChildViewController
{
    //购彩大厅
    LJHallViewController *hall = [[LJHallViewController alloc] init];
    //描述对应按钮的内容
    
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    //竞技场
    LJArenaViewController *arena = [[LJArenaViewController alloc] init];
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    //发现
    UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"LJDiscoverViewController" bundle:nil];
    LJDiscoverViewController *discover = [stroryboard instantiateInitialViewController];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    //开奖信息
    LJHistoryViewController *history = [[LJHistoryViewController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    //我的彩票
    LJMyLotteryViewController *myLotter = [[LJMyLotteryViewController alloc] init];
    [self setUpOneChildViewController:myLotter image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
    
}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    vc.navigationItem.title = title;
    
    //描述对应按钮的内容
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    [self.items addObject:vc.tabBarItem];
    
//    vc.view.backgroundColor = [self randomColor];
    
    //把控制器包装成导航控制器
    UINavigationController *nav = [[LJNavigationController alloc] initWithRootViewController:vc];
    
    //设置背景图片必须使用UIBarMetricsDefault
    //[nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    if ([vc isKindOfClass:[LJArenaViewController class]]) {
        nav = [[LJArenaNavController alloc] initWithRootViewController:vc];
    }
    
    [self addChildViewController:nav];
}

- (UIColor *)randomColor
{
    //不写.0生成的数值为零
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


@end
