//
//  LJBaseSettingViewController.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJBaseSettingViewController.h"
#import "LJSettingGroup.h"
#import "LJSettingCell.h"
#import "LJArrowSettingItem.h"


@interface LJBaseSettingViewController ()



@end

@implementation LJBaseSettingViewController

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
