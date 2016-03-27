//
//  LJBaseTabBarController.m
//  EaseMobIMTest
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJBaseTabBarController.h"
#import "LJContactsViewController.h"
#import "LJHomeViewController.h"
#import "LJMeViewController.h"
#import "LJTimeLineViewController.h"

@interface LJBaseTabBarController ()

@end

@implementation LJBaseTabBarController {
    NSMutableArray *_arrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadChildsController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  加载子控制器
 */
- (void)loadChildsController {
    _arrM = [NSMutableArray array];
    
    LJHomeViewController *homeVC = [[LJHomeViewController alloc]init];
    [self EmbedNavigationController:homeVC title:@"首页"];
    
    LJContactsViewController *contactsVC = [[LJContactsViewController alloc]init];
    [self EmbedNavigationController:contactsVC title:@"联系人"];

    LJTimeLineViewController *timeLineVC = [[LJTimeLineViewController alloc]init];
    [self EmbedNavigationController:timeLineVC title:@"朋友圈"];

    LJMeViewController   *meVC = [[LJMeViewController alloc]init];
    [self EmbedNavigationController:meVC title:@"我"];
    
    self.viewControllers = _arrM.copy;
    
}
/**
 *  嵌入Navigation
 *
 *  @param viewController viewController
 */
- (void)EmbedNavigationController:(UIViewController *)viewController title:(NSString *)title {
    viewController.title = title;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [_arrM addObject:nav];
}
@end
