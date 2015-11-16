//
//  HeroDetailViewController.h
//  my_port
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UIViewController
@property (nonatomic, strong)NSString * HeroName;
- (IBAction)didClickCollection:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIImageView *heroPic;
@property (weak, nonatomic) IBOutlet UILabel *disPlayName;
@property (weak, nonatomic) IBOutlet UILabel *tigsLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduce;
- (IBAction)didClickSugesst:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *but_B;
@property (weak, nonatomic) IBOutlet UIButton *but_Q;
@property (weak, nonatomic) IBOutlet UIButton *but_W;
@property (weak, nonatomic) IBOutlet UIButton *but_E;
@property (weak, nonatomic) IBOutlet UIButton *but_R;


- (IBAction)skill_B:(UIButton *)sender;
- (IBAction)skill_Q:(UIButton *)sender;
- (IBAction)skill_W:(UIButton *)sender;
- (IBAction)skill_E:(UIButton *)sender;
- (IBAction)skill_R:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *skill_des;
@property (weak, nonatomic) IBOutlet UIView *likeView;
@property (weak, nonatomic) IBOutlet UIImageView *likeHero;
@property (weak, nonatomic) IBOutlet UILabel *like_des;


@property (weak, nonatomic) IBOutlet UIView *heatView;
@property (weak, nonatomic) IBOutlet UIImageView *heatHero;
@property (weak, nonatomic) IBOutlet UILabel *hate_des;
@property (weak, nonatomic) IBOutlet UILabel *useLabel;
@property (weak, nonatomic) IBOutlet UILabel *kezhiLabel;
@property (weak, nonatomic) IBOutlet UILabel *backLabel;

@end
