//
//  RankListModel.h
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankListModel : NSObject

@property (nonatomic, strong)NSString * cover_url; // 图片

@property (nonatomic, strong)NSString * title; // 标题

@property (nonatomic, strong)NSString * upload_time; // 上传时间

@property (nonatomic, strong)NSString * video_length; // 视频长度

@property (nonatomic, strong)NSString * amount_play; // 播放次数

@property(nonatomic ,strong)NSString *vid;
@end
