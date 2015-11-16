//
//  KindCollectionViewCell.h
//  my_port
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KindVideoModel.h"

@interface VideoKindCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *VIdeoImageView;

-(void)fetchVideoModel:(KindVideoModel *)model;

@end
