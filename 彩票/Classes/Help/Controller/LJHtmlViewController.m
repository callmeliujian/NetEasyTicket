//
//  LJHtmlViewController.m
//  彩票
//
//  Created by 😄 on 16/8/21.
//  Copyright © 2016年 😄. All rights reserved.
//

#import "LJHtmlViewController.h"

@interface LJHtmlViewController ()<UIWebViewDelegate>

@end

@implementation LJHtmlViewController

- (void)loadView
{
    //自定义view
    self.view = [[UIWebView alloc] initWithFrame:LJScreenBounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(dismiss)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = (UIWebView *)self.view;
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.html" ofType:nil];
//    
//    //文件路径中有中文，转换URL会失败
//    //解决方法：转换下百分号
//    
//    filePath = [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSURL *url = [NSURL URLWithString:filePath];
    
    NSURL *url  = [[NSBundle mainBundle] URLForResource:_htmlItem.html withExtension:nil];
    
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString *javaStr = [NSString stringWithFormat:@"window.location.href = '#%@';",_htmlItem.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:javaStr];
}



- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
