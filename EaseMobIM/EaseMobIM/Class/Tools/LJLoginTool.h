//
//  LJLoginTool.h
//  EaseMobIM
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJLoginTool : NSObject
@property (nonatomic, assign) BOOL isLogin;
+ (instancetype)shared;

- (void)loginOrNot;

- (void)archiveRootObject:(id)object;
@end
