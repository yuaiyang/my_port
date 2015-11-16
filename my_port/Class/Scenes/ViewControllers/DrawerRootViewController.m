//
//  DrawerRootViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/24.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "DrawerRootViewController.h"
#import "LeftViewController.h"

@implementation DrawerRootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftVC"];    
    self.backgroundImage = [UIImage imageNamed:@"魄罗.png"];
    self.delegate = self;

}

@end
