//
//  MainViewController.m
//  hhgShareDemo
//
//  Created by IOS on 17/2/28.
//  Copyright © 2017年 2015-10-17. All rights reserved.
//

#import "MainViewController.h"
#import "ShareViewController.h"
#import "LoginViewController.h"
#import "ShopWebViewController.h"
#import "StepViewController.h"

#define Screen_Height  [UIScreen mainScreen].bounds.size.height
#define Screen_Width   [UIScreen mainScreen].bounds.size.width
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * table;
    NSArray * functionArray;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    functionArray = @[@"第三方分享",@"第三方登录",@"网上商城",@"计步"];
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
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (indexPath.row == 0) {
        // 获取指定的Storyboard，name填写Storyboard的文件名
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        ShareViewController * receive = [storyboard instantiateViewControllerWithIdentifier:@"Share"];
        [self.navigationController pushViewController:receive animated:YES];
    }
    else if(indexPath.row == 1)
    {
        LoginViewController * receive = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
        [self.navigationController pushViewController:receive animated:YES];
    }
    else if(indexPath.row == 2)
    {
        ShopWebViewController * shop = [[ShopWebViewController alloc]init];
        [self.navigationController pushViewController:shop animated:YES];
    }
    else
    {
        StepViewController * step = [storyboard instantiateViewControllerWithIdentifier:@"step"];
        [self.navigationController pushViewController:step animated:YES];
        
    }
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
