//
//  WinOddsModel.h
//  NO_2
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WinOddsModel : NSObject

@property (nonatomic, strong)NSString * nameCN;//中文名字
@property (nonatomic, strong)NSString * nameUS;//美国名字
@property (nonatomic, assign)float presentRate;//出场率
@property (nonatomic, assign)float totalPresent;//出场次数
@property (nonatomic, assign)float winRate;//胜率
@property (nonatomic, strong)NSString * titleCN;//中文称号
@end
