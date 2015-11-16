//
//  MessageTableViewCell.m
//  Message_Box
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 杨文杰. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell


-(void)setModle:(MessageListModel *)modle
{
    [_messageImageView sd_setImageWithURL:[NSURL URLWithString:modle.image_url_big]];
    _messageTitle.text = modle.title;
    _messageSummary.text = modle.summary;
    
    NSString * timeString = [self changTimeToStringWithString:modle.publication_date];

    self.timeLabel.text = [self changeTimeToStringWithPublishTime:[timeString integerValue] timeStr:modle.publication_date];
    
}

- (NSString *)changTimeToStringWithString:(NSString *)timeStr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:timeStr]; //------------将字符串按formatter转成nsdate
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSString *nowtimeStr = [formatter stringFromDate:date];//----------将nsdate按formatter格式转成nsstring
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

/**时间转换@“1444444444"格式*/
- (NSString *)changeTimeToStringWithPublishTime:(NSInteger)publishTime timeStr:(NSString *)timeStr {

//    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval sinceNow =[[NSDate date] timeIntervalSince1970] - publishTime;
    NSString * timeString = @"";
    if (sinceNow/3600<1) {
        
        timeString = [NSString stringWithFormat:@"%f", sinceNow/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num= [timeString intValue];
        
        if (num <= 1) {
            
            timeString = [NSString stringWithFormat:@"刚刚..."];
            return timeString;
        }else{
            
            timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
            return timeString;
        }
    }
    if (sinceNow/3600>1&&sinceNow/86400<1) {
        
        timeString = [NSString stringWithFormat:@"%f", sinceNow/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
        return timeString;
    }
    
    if (sinceNow/86400>1) {
        
        timeString = [NSString stringWithFormat:@"%f", sinceNow/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        int num=[timeString intValue];
        
        if (num<2) {
            
            timeString=[NSString stringWithFormat:@"昨天"];
            return timeString;
        }else if (num==2){
            
            timeString = [NSString stringWithFormat:@"前天"];
            
            return timeString;
        }else{
            return [[timeStr componentsSeparatedByString:@" "] firstObject];
        }
       
//        else if (num>2&&num<7){
//            
//            timeString = [NSString stringWithFormat:@"%@天前", timeString];
//            return timeString;
//        }else if (num >= 7 && num <=30) {
//            
//            timeString = [NSString stringWithFormat:@"1周前"];
//            return timeString;
//        }else if(num > 30 && num <=365){
//            
//            int month=sinceNow/(86400*30);
//            timeString=[NSString stringWithFormat:@"%d",month];
//            timeString = [NSString stringWithFormat:@"%@周前",timeString];
//            return timeString;
//        }else if (num >365){
//            
//            int year=sinceNow/(86400*365);
//            timeString=[NSString stringWithFormat:@"%d",year];
//             timeString = [NSString stringWithFormat:@"%@年前",timeString];
//            return timeString;
//        }
    }
    return timeString;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
