//
//  LJLoginViewController.m
//  EaseMobIM
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJLoginViewController.h"
#import "LJLoginModel.h"
#import "LJLoginTool.h"

@interface LJLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//注册按钮
- (IBAction)registerBtnClick {
    NSLog(@"%s",__FUNCTION__);
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.userName.text password:self.password.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
        if (!error) {
            NSLog(@"注册成功");
        }else {
            NSLog(@"用户名存在,重试");
        }
    } onQueue:nil];
}

//登录按钮
- (IBAction)LoginBtnClick {
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.userName.text password:self.password.text completion:^(NSDictionary *loginInfo, EMError *error) {
        if (!error && loginInfo) {
            NSLog(@"登陆成功");
            LJLoginModel *model = [[LJLoginModel alloc]init];
            
            [[LJLoginTool shared] archiveRootObject:model];
        
            //自动登录
            [[EaseMob sharedInstance].chatManager enableAutoLogin];
            
            //发出通知
            [[NSNotificationCenter defaultCenter] postNotificationName:kIsChangeRootViewController object:nil];
            
        }else {
             NSLog(@"用户名或密码错误");
        }
    } onQueue:nil];
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
