//
//  CategoryCollectionViewCell.h
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *CategroyName;
@property (weak, nonatomic) IBOutlet UIButton *CategoryButoon;
- (IBAction)DidClickToDetail:(UIButton *)sender;


@end
