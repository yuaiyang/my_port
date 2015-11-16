//
//  CateDetailTableViewCell.h
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CateDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catePicView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLael;
@property (weak, nonatomic) IBOutlet UIView *needView;
@property (weak, nonatomic) IBOutlet UIView *CompView;

@end
