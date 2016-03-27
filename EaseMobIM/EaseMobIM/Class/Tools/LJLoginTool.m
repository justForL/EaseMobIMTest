//
//  LJLoginTool.m
//  EaseMobIM
//
//  Created by James on 16/3/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJLoginTool.h"

@implementation LJLoginTool
static LJLoginTool *_INSTANCE;
//归档路径
#define kArchiverPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"userName.plist"]

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _INSTANCE = [[self alloc]init];
    });
    return _INSTANCE;
}
/**
 *  是否已经登录
 */
- (void)loginOrNot {

   _INSTANCE.isLogin = [NSKeyedUnarchiver unarchiveObjectWithFile:kArchiverPath];
}
/**
 *  归档用户名和密码
 *
 *  @param object 登录模型
 */
- (void)archiveRootObject:(id)object {
    
    [NSKeyedArchiver archiveRootObject:object toFile:kArchiverPath];
}
@end
