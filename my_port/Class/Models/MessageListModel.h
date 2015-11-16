//
//  MessageListModel.h
//  Message_Box
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 杨文杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListModel : NSObject

@property (nonatomic , strong) NSString * title;//列表标题
@property (nonatomic , strong) NSString * summary;//列表介绍
@property (nonatomic , strong) NSString * image_url_big;//列表图片
@property (nonatomic , strong) NSString * publication_date;//发表时间
@property (nonatomic , strong) NSString * article_url;//详情

@property (nonatomic , strong) NSString * is_direct;


@end
