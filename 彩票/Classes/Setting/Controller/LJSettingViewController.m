//
//  LJSettingViewController.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJSettingViewController.h"
#import "LJSettingItem.h"
#import "LJSettingGroup.h"
#import "LJArrowSettingItem.h"
#import "LJSwitchSettingItem.h"
#import "LJSettingCell.h"
#import "LJBlurView.h"
#import <MBProgressHUD.h>
#import "LJPushViewController.h"
#import "LJHelpViewController.h"

@interface LJSettingViewController ()

//当前tableview所有数组总数
@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation LJSettingViewController

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStyleBordered target:self action:@selector(help)];
    
    //第一组
    [self setUpGroup0];
    
    //第一组
    [self setUpGroup1];
    
    //第二组
    [self setUpGroup2];
}

- (void)help
{
    LJHelpViewController *helpVc = [[LJHelpViewController alloc] init];
    helpVc.title = @"帮助";
    [self.navigationController pushViewController:helpVc animated:YES];
}

- (void)setUpGroup0
{
    LJArrowSettingItem *redeemCode = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    
    redeemCode.descVc = [UIViewController class];
    
    LJSettingGroup *group = [LJSettingGroup groupWithItems:@[redeemCode]];
    
    [self.groups addObject:group];
    
}

- (void)setUpGroup1
{
    LJArrowSettingItem *item1 = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"推送和提醒"];
    
    item1.descVc = [LJPushViewController class];
    
    LJSwitchSettingItem *item2 = [LJSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJSwitchSettingItem *item3 = [LJSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJSwitchSettingItem *item4 = [LJSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJSwitchSettingItem *item5 = [LJSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    
    LJSettingGroup *group = [LJSettingGroup groupWithItems:@[item1, item2, item3, item4, item5]];
    
    [self.groups addObject:group];
    
}

- (void)setUpGroup2
{
    LJArrowSettingItem *newVersion = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"检查最新版本"];
    newVersion.itemOpertion = ^{
      
        LJBlurView *blurView = [[LJBlurView alloc] initWithFrame:LJScreenBounds];
        [LJKeyWindow addSubview:blurView];
        
        [MBProgressHUD showSuccess:@"当前没有最新版本"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blurView removeFromSuperview];
        });
        
    };
    
    LJArrowSettingItem *item2 = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJArrowSettingItem *item3 = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJArrowSettingItem *item4 = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    LJArrowSettingItem *item5 = [LJArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] :@"使用兑换码"];
    
    LJSettingGroup *group = [LJSettingGroup groupWithItems:@[newVersion, item2, item3, item4, item5]];
    
    [self.groups addObject:group];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    LJSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //创建cell
    LJSettingCell *cell = [LJSettingCell cellWithTebleView:tableView];
    
    //取出那一组
    LJSettingGroup *group = self.groups[indexPath.section];
    
    //取出哪一行
    LJSettingItem *item = group.items[indexPath.row];
    
    //给cell传递模型
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LJSettingGroup *group = self.groups[section];
    return group.headTitle;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    LJSettingGroup *group = self.groups[section];
//    return group.footTitle;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //取出那一组
    LJSettingGroup *group = self.groups[indexPath.section];
    
    //取出哪一行
    LJSettingItem *item = group.items[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion();
        //return;
    }
    
    if ([item isKindOfClass:[LJArrowSettingItem class]]) {
        LJArrowSettingItem *arrowItem = (LJArrowSettingItem *)item;
        
        if (arrowItem.descVc) {
            //跳转
            
            //创建跳转控制器
            UIViewController *vc = [[arrowItem.descVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
