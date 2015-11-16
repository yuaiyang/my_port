//
//  TheLatestVideoTableViewCell.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "TheLatestVideoTableViewCell.h"

@implementation TheLatestVideoTableViewCell

-(void)setLatestVideo:(TheLatestVideo *)latestVideo
{
    [_cover_urlLabel sd_setImageWithURL:[NSURL URLWithString:latestVideo.cover_url]];
    _titleLabel.text = latestVideo.title;
    _upload_timeLabel.text = latestVideo.upload_time;
    _video_lengthLabel.text = [NSString localizedStringWithFormat:@"%.2ld:%.2ld",(long)latestVideo.video_length/60,latestVideo.video_length%60];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
