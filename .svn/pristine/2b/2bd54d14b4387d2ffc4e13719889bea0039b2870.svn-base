//
//  BestDetailViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "BestDetailViewController.h"

@interface BestDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *des;

@property (weak, nonatomic) IBOutlet UIImageView *hero_1;
@property (weak, nonatomic) IBOutlet UIImageView *hero_2;
@property (weak, nonatomic) IBOutlet UIImageView *hero_3;
@property (weak, nonatomic) IBOutlet UIImageView *hero_4;
@property (weak, nonatomic) IBOutlet UIImageView *hero_5;
@property (weak, nonatomic) IBOutlet UIImageView *des_img1;
@property (weak, nonatomic) IBOutlet UIImageView *des_img2;
@property (weak, nonatomic) IBOutlet UIImageView *des_img3;
@property (weak, nonatomic) IBOutlet UIImageView *des_img4;
@property (weak, nonatomic) IBOutlet UIImageView *des_img5;
@property (weak, nonatomic) IBOutlet UILabel *des_1;
@property (weak, nonatomic) IBOutlet UILabel *des_2;
@property (weak, nonatomic) IBOutlet UILabel *des_3;
@property (weak, nonatomic) IBOutlet UILabel *des_4;
@property (weak, nonatomic) IBOutlet UILabel *des_5;

@end

@implementation BestDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleLabel.text = _best_model.title;
    
    [self.hero_1 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero1)]];
    [self.hero_2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero2)]];
    [self.hero_3 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero3)]];
    [self.hero_4 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero4)]];
    [self.hero_5 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero5)]];
    
    [self.des_img1 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero1)]];
    [self.des_img2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero2)]];
    [self.des_img3 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero3)]];
    [self.des_img4 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero4)]];
    [self.des_img5 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_best_model.hero5)]];
    
    self.des_1.text = _best_model.des1;
    self.des_2.text = _best_model.des2;
    self.des_3.text = _best_model.des3;
    self.des_4.text = _best_model.des4;
    self.des_5.text = _best_model.des5;
    self.des.text = _best_model.des;

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
