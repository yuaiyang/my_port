//
//  CategoryViewController.h
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSString * tag;
@end
