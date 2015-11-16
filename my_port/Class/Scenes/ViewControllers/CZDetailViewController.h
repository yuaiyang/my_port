//
//  CZDetailViewController.h
//  NO_2
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZModel.h"
@interface CZDetailViewController : UIViewController
@property (nonatomic, strong)CZModel * CZ_model;
@property (nonatomic, strong)NSString * hero_Name;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIImageView *heroPic;
@property (weak, nonatomic) IBOutlet UILabel *disPlayName;
@property (weak, nonatomic) IBOutlet UILabel *authour;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UIImageView *skill_5;
@property (weak, nonatomic) IBOutlet UIImageView *skill_1;
@property (weak, nonatomic) IBOutlet UIImageView *skill_2;
@property (weak, nonatomic) IBOutlet UIImageView *skill_3;
@property (weak, nonatomic) IBOutlet UIImageView *skill_4;
@property (weak, nonatomic) IBOutlet UIImageView *skill_6;
@property (weak, nonatomic) IBOutlet UIImageView *skill_7;
@property (weak, nonatomic) IBOutlet UIImageView *skill_8;
@property (weak, nonatomic) IBOutlet UIImageView *skill_9;
@property (weak, nonatomic) IBOutlet UIImageView *skill_10;
@property (weak, nonatomic) IBOutlet UIImageView *skill_11;
@property (weak, nonatomic) IBOutlet UIImageView *skill_12;
@property (weak, nonatomic) IBOutlet UIImageView *skill_13;
@property (weak, nonatomic) IBOutlet UIImageView *skill_14;
@property (weak, nonatomic) IBOutlet UIImageView *skill_15;
@property (weak, nonatomic) IBOutlet UIImageView *skill_16;
@property (weak, nonatomic) IBOutlet UIImageView *skill_17;
@property (weak, nonatomic) IBOutlet UIImageView *skill_18;
@property (weak, nonatomic) IBOutlet UIImageView *chumen_1;
@property (weak, nonatomic) IBOutlet UIImageView *chumen_2;
@property (weak, nonatomic) IBOutlet UIImageView *chumen_3;
@property (weak, nonatomic) IBOutlet UIImageView *chumen_4;
@property (weak, nonatomic) IBOutlet UIImageView *chumen_5;

@property (weak, nonatomic) IBOutlet UIImageView *mid_1;
@property (weak, nonatomic) IBOutlet UIImageView *mid_2;
@property (weak, nonatomic) IBOutlet UIImageView *mid_3;
@property (weak, nonatomic) IBOutlet UIImageView *mid_4;
@property (weak, nonatomic) IBOutlet UIImageView *mid_5;
@property (weak, nonatomic) IBOutlet UIImageView *mid_6;
@property (weak, nonatomic) IBOutlet UIImageView *end_1;
@property (weak, nonatomic) IBOutlet UIImageView *end_2;
@property (weak, nonatomic) IBOutlet UIImageView *end_3;
@property (weak, nonatomic) IBOutlet UIImageView *end_4;
@property (weak, nonatomic) IBOutlet UIImageView *end_5;
@property (weak, nonatomic) IBOutlet UIImageView *end_6;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_1;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_2;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_3;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_4;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_5;
@property (weak, nonatomic) IBOutlet UIImageView *nifeng_6;
@property (weak, nonatomic) IBOutlet UILabel *chumenmiaoshu;
@property (weak, nonatomic) IBOutlet UILabel *zhongqimaioshu;
@property (weak, nonatomic) IBOutlet UILabel *houqimiaoshu;
@property (weak, nonatomic) IBOutlet UILabel *nifengmiaoshu;

@end
