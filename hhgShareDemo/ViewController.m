//
//  ViewController.m
//  hhgShareDemo
//
//  Created by xinguo on 15/10/17.
//  Copyright (c) 2015年 2015-10-17. All rights reserved.
//

#import "ViewController.h"
#import "ShareViewController.h"
#import "LoginViewController.h"

#define Screen_Height  [UIScreen mainScreen].bounds.size.height
#define Screen_Width   [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * table;
    NSArray * functionArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    functionArray = @[@"第三方分享",@"第三方登录"];
    self.view .backgroundColor = [UIColor yellowColor];
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return functionArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellid"];
    cell.textLabel.text = functionArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        ShareViewController * receive = [storyboard instantiateViewControllerWithIdentifier:@"Share"];
        [self.navigationController pushViewController:receive animated:YES];
    }
    else
    {
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController * receive = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
        [self.navigationController pushViewController:receive animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
