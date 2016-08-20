//
//  LJNavigationController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJNavigationController.h"

@interface LJNavigationController ()

@end

@implementation LJNavigationController

//当前类或者它的子类第一次使用的时候才会调用
+(void)initialize
{
    //获取当前应用下所有的导航条
    //UINavigationBar *bar = [UINavigationBar appearance];
    //获取当前类下的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条标题颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:titleAttr];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //滑动返回
    //self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //self:导航控制器
    if (self.viewControllers.count != 0) {  //非根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置返回按钮image
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
