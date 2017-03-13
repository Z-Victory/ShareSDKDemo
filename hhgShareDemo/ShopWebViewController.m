//
//  ShopWebViewController.m
//  hhgShareDemo
//
//  Created by IOS on 17/3/10.
//  Copyright © 2017年 2015-10-17. All rights reserved.
//
#define Screen_Height  [UIScreen mainScreen].bounds.size.height
#define Screen_Width   [UIScreen mainScreen].bounds.size.width
#import "ShopWebViewController.h"

@interface ShopWebViewController ()

@end

@implementation ShopWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.suning.com"]];
    [web loadRequest:request];
    [self.view addSubview:web];
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
