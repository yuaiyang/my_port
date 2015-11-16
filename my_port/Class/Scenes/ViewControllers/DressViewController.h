//
//  DressViewController.h
//  my_port
//
//  Created by lanou3g on 15/11/2.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *dressView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong)NSString * HeroName;
@end
