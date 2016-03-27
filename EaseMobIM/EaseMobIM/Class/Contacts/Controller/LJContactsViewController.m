//
//  LJContactsViewController.m
//  EaseMobIMTest
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJContactsViewController.h"

@interface LJContactsViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation LJContactsViewController {
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


@end
