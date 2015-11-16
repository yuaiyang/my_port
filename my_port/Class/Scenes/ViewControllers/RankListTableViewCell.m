//
//  RankListTableViewCell.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "RankListTableViewCell.h"

@implementation RankListTableViewCell

-(void)setRankModel:(RankListModel *)rankModel
{
    [_imageViewLabel sd_setImageWithURL:[NSURL URLWithString:rankModel.cover_url]];
    _titleLabel.text = rankModel.title;
    _upload_timeLabel.text = rankModel.upload_time;
    _video_lengthLabel.text = [NSString stringWithFormat:@"%.2ld:%.2ld", [rankModel.video_length integerValue]/60, [rankModel.video_length integerValue]%60];
    _amount_playLabel.text = rankModel.amount_play;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
