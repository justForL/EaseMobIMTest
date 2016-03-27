//
//  LJContactsViewController.m
//  EaseMobIMTest
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJContactsListViewController.h"
#import "LJConversationViewController.h"

@interface LJContactsListViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation LJContactsListViewController {
    UITableView      *_tableView;
    NSArray          *_contacts;
}
#define kContactsCellID @"kContactsCellID"
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareTableView];
    
}

- (void)prepareTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kContactsCellID];
    [self.view addSubview:_tableView];
    _contacts = [[EaseMob sharedInstance].chatManager buddyList];

}

#pragma  mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   return  _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kContactsCellID forIndexPath:indexPath];

    EMBuddy *emBuddy = _contacts[indexPath.row];
    
    cell.textLabel.text = emBuddy.username;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取数组中的模型
    EMBuddy *emBuddy = _contacts[indexPath.row];
    
    LJConversationViewController *conVC = [[LJConversationViewController alloc]init];
    //设置标题
    conVC.title = emBuddy.username;
    //传递模型
    conVC.emBuddy = emBuddy;
    
    conVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:conVC animated:YES];
    
}

@end
