//
//  TheLatestVideoTableViewCell.h
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheLatestVideo.h"
@interface TheLatestVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cover_urlLabel; // 图片
@property (weak, nonatomic) IBOutlet UILabel *titleLabel; // 标题
@property (weak, nonatomic) IBOutlet UILabel *upload_timeLabel; // 更新时间
@property (weak, nonatomic) IBOutlet UILabel *video_lengthLabel; // 视频长度

@property (nonatomic, strong)TheLatestVideo * latestVideo; //用来接收从cellForRow方法中传过来的值

@end
