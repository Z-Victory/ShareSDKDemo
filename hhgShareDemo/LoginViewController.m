//
//  LoginViewController.m
//  hhgShareDemo
//
//  Created by IOS on 17/2/28.
//  Copyright © 2017年 2015-10-17. All rights reserved.
//

#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface LoginViewController ()<UIActionSheetDelegate>
{
    SSDKPlatformType type;
    BOOL isLogin;
    IBOutlet UIButton * logoinBtn;
    IBOutlet UIButton * logoutBtn;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isLogin = NO;
    if (!isLogin) {
        logoinBtn.hidden = NO;
        logoutBtn.hidden = YES;
    }
    else
    {
        logoinBtn.hidden = YES;
        logoutBtn.hidden = NO;
    }
    // Do any additional setup after loading the view.
}
-(IBAction)clickWechat:(id)sender
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信",@"QQ", nil];
    [actionSheet showInView:self.view];
}
 /**
 *  取消分享平台授权
 *
 *  @param platformType  平台类型
 */
//+ (void)cancelAuthorize:(SSDKPlatformType)platformType;

/**
 *  判断分享平台是否授权
 *
 *  @param platformType 平台类型
 *  @return YES 表示已授权，NO 表示尚未授权
 */
//+ (BOOL)hasAuthorized:(SSDKPlatformType)platformTypem;
- (IBAction)logout:(id)sender
{
    if (isLogin) {
        [ShareSDK cancelAuthorize:type];
        logoinBtn.hidden = NO;
        logoutBtn.hidden = YES;
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        type = SSDKPlatformTypeWechat;
    }
    else if(buttonIndex == 1)
    {
        type = SSDKPlatformTypeQQ;
    }
    else
    {
        return;
    }
    [ShareSDK getUserInfo:type onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            
            isLogin = YES;
            logoinBtn.hidden = YES;
            logoutBtn.hidden = NO;
            
            NSLog(@"uid=%@",user.uid);
            NSLog(@"%@",user.credential);
            NSLog(@"token=%@",user.credential.token);
            NSLog(@"nickname=%@",user.nickname);
            /*
             在这里面实现app界面的跳转：
             　　　　　　　　1.如果用户将qq和app已经进行了绑定，直接登录成功就能拿到用户的数据；
             　　　　　　　　2.如果用户没有将qq和app进行绑定，那么绑定成功后就会从服务器获取到token，这个token是用来获取用户数据的，很重要。
             　　　　　　　　总之：每一个用户都有自己唯一的标识，使用第三方登录，第三方是不知道用户的账号和密码的，那么用户必须先绑定，绑定成功后，服务器返回这个标识，之后服务器通过这个标识才能获取到用户的数据。
             */
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
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
