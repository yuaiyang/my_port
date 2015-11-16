//
//  UserLoginManager.m
//  NO_2
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "UserLoginManager.h"

@implementation UserLoginManager
+ (instancetype)SharedInstance
{
    static UserLoginManager * shareManager = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        shareManager = [[UserLoginManager alloc] init];
    
    });
    
    return shareManager;
}
- (user *)getAuserByUserName:(NSString *)userName
{
    NSString * bendiPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * string = [NSString stringWithFormat:@"%@.txt",userName];
    NSString * userPath = [bendiPath stringByAppendingPathComponent:string];
    NSData * hahadata = [NSData dataWithContentsOfFile:userPath];
    //创建反归档工具
    NSKeyedUnarchiver * unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:hahadata];
    user * p  =[unArchiver decodeObjectForKey:userName];
    [unArchiver finishDecoding];
    if (p) {
        self.user = p;
        return p;
    }

    return nil;
}

- (void)regisAUser:(NSString *)userName
{

    user * Auser = [user new];
    Auser.name = userName;
    Auser.heroNameArray = [NSMutableArray array];
    //2.(创建归档器)
    NSMutableData * TempData = [NSMutableData data];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:TempData];
    //3.归档
    
    [archiver encodeObject:Auser forKey:userName];
    //结束归档
    [archiver finishEncoding];
    //writeToFile
    NSString * bendiPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * string = [NSString stringWithFormat:@"%@.txt",userName];
    NSString * personPath = [bendiPath stringByAppendingPathComponent:string];
    
    [TempData writeToFile:personPath atomically:YES];
    
}
- (void)shoucang:(NSString *)heroName
{
    user * Auser = [user new];
    Auser.name = _user.name;
    Auser.heroNameArray = _user.heroNameArray;
    if (heroName) {
        [Auser.heroNameArray addObject:heroName];   
    }
        //2.(创建归档器)
    NSMutableData * TempData = [NSMutableData data];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:TempData];
    //3.归档
    
    [archiver encodeObject:Auser forKey:_user.name];
    //结束归档
    [archiver finishEncoding];
    //writeToFile
    NSString * bendiPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * string = [NSString stringWithFormat:@"%@.txt",_user.name];
    NSString * personPath = [bendiPath stringByAppendingPathComponent:string];
    
    [TempData writeToFile:personPath atomically:YES];
}
@end
