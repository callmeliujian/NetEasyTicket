//
//  LJArenaViewController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJArenaViewController.h"

@interface LJArenaViewController ()

@end

@implementation LJArenaViewController

//自定义控制器view
- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:LJScreenBounds];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"zuqiu",@"lanqiu"]];
    
    //设置UISegmentedControl背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    seg.selectedSegmentIndex = 0;
    
    //设置边框颜色
    seg.tintColor = LJColor(0, 142, 143);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    self.navigationItem.titleView = seg;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
