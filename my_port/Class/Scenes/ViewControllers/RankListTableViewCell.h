//
//  RankListTableViewCell.h
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankListModel.h"
@interface RankListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLabel; // 图片
@property (weak, nonatomic) IBOutlet UILabel *titleLabel; // 标题
@property (weak, nonatomic) IBOutlet UILabel *upload_timeLabel; // 上传时间
@property (weak, nonatomic) IBOutlet UILabel *video_lengthLabel; // 视频时长
@property (weak, nonatomic) IBOutlet UILabel *amount_playLabel; // 播放次数

@property (nonatomic, strong)RankListModel * rankModel; // 接收从cellForRow方法中传过来的值

@end
