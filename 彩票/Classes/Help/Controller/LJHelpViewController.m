//
//  LJHelpViewController.m
//  彩票
//
//  Created by 😄 on 16/8/20.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJHelpViewController.h"
#import "LJHtmlItem.h"
#import "LJNavigationController.h"
#import "LJHtmlViewController.h"

@interface LJHelpViewController ()

@property (nonatomic, strong) NSMutableArray *htmls;

@end

@implementation LJHelpViewController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSMutableArray *)htmls
{
    if (_htmls == nil) {
        _htmls = [NSMutableArray array];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSArray *dictArry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *dict in dictArry) {
            LJHtmlItem *item = [LJHtmlItem itemWithDict:dict];
            [_htmls addObject:item];
        }
        
    }
    
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpGroup];
    
}

- (void)setUpGroup
{
    [self htmls];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.htmls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //取出模型
    LJHtmlItem *item = self.htmls[indexPath.row];
    
    cell.textLabel.text = item.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //取出模型
    LJHtmlItem *item = self.htmls[indexPath.row];
    
    LJHtmlViewController *htmlVc = [[LJHtmlViewController alloc] init];
    
    htmlVc.title = item.title;
    htmlVc.htmlItem = item;
    
    LJNavigationController *nav  = [[LJNavigationController alloc] initWithRootViewController:htmlVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
