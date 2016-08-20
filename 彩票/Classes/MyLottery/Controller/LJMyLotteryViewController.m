//
//  LJMyLotteryViewController.m
//  彩票
//
//  Created by 😄 on 16/8/19.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJMyLotteryViewController.h"
#import "LJSettingViewController.h"

@interface LJMyLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LJMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取按钮背景图片
    UIImage *image = _loginBtn.currentBackgroundImage;
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 注意按钮的图片只能通过代码去拉伸
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];

    [self setUpNav];
}

- (void)setUpNav
{
    //设置左右两边的按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    //尺寸自适应
    [btn sizeToFit];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    //左边
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
}

- (void)setting
{
    
    LJSettingViewController *vc = [[LJSettingViewController alloc] init];
    
    //跳转到设置界面
    [self.navigationController pushViewController:vc animated:YES];
}

@end
