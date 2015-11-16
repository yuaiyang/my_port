//
//  FreeHeroCell.h
//  my_port
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreeHeroCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *heroImgView;
@property (weak, nonatomic) IBOutlet UILabel *cn_name;
@property (weak, nonatomic) IBOutlet UILabel *ni_name;
@property (weak, nonatomic) IBOutlet UILabel *location;

@end
