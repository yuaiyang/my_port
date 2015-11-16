//
//  KindViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "KindViewController.h"
#import "CategoryTableViewController.h"
#import "BestGroupTableViewController.h"
#import "WinOddsTableViewController.h"
#import "TopForHeroController.h"
@interface KindViewController ()
@property (nonatomic, assign)CGPoint point;
@end

@implementation KindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view_1.layer.cornerRadius = self.view_1.frame.size.height/2+7;
//    self.view_1.layer.masksToBounds = YES;
//    
//    self.view_2.layer.cornerRadius = self.view_1.frame.size.height/2+7;
//    self.view_2.layer.masksToBounds = YES;
//    self.view_3.layer.cornerRadius = self.view_1.frame.size.height/2+7;
//    self.view_3.layer.masksToBounds = YES;
//    self.view_4.layer.cornerRadius = self.view_1.frame.size.height/2+7;
//    self.view_4.layer.masksToBounds = YES;
    
    self.view_1.layer.cornerRadius = self.view_1.frame.size.height/3+7;
    self.view_1.layer.masksToBounds = YES;
    
    self.view_2.layer.cornerRadius = self.view_1.frame.size.height/3+7;
    self.view_2.layer.masksToBounds = YES;
    self.view_3.layer.cornerRadius = self.view_1.frame.size.height/3+7;
    self.view_3.layer.masksToBounds = YES;
    self.view_4.layer.cornerRadius = self.view_1.frame.size.height/3+7;
    self.view_4.layer.masksToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)but_1:(UIButton *)sender {
    __weak KindViewController * VC = self;
    [UIView animateWithDuration:0.5 animations:^{
        
        VC.point = VC.view_1.center;
        //对视图动画和视图属性进行设置
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:YES];
        VC.view_1.center = VC.view.center;
       
        
        VC.view_1.transform = CGAffineTransformRotate(VC.view_1.transform, M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            //[UIView setAnimationDelay:20];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            VC.view_1.center = VC.point;
            VC.view_1.transform = CGAffineTransformRotate(VC.view_1.transform, M_PI);
            CategoryTableViewController * CVC = [[CategoryTableViewController alloc] init];
            [self.navigationController pushViewController:CVC animated:YES];
            
        } completion:nil];
        

    }];
    
    
}

- (IBAction)but_2:(UIButton *)sender {
    __weak KindViewController * VC = self;
    [UIView animateWithDuration:0.5 animations:^{
        VC.point = VC.view_2.center;
        //对视图动画和视图属性进行设置
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:YES];
        VC.view_2.center = VC.view.center;
        
        VC.view_2.transform = CGAffineTransformRotate(VC.view_2.transform, M_PI);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            //[UIView setAnimationDelay:20];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            VC.view_2.center = VC.point;
            VC.view_2.transform = CGAffineTransformRotate(VC.view_2.transform, M_PI);
            WinOddsTableViewController * WVC = [[WinOddsTableViewController alloc] init];
            
            [self.navigationController pushViewController:WVC animated:YES];
            
        } completion:nil];
        
        
    }];
}
- (IBAction)but_3:(UIButton *)sender {
    __weak KindViewController * VC = self;
    [UIView animateWithDuration:0.5 animations:^{
         VC.point = VC.view_3.center;
        //对视图动画和视图属性进行设置
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:YES];
        VC.view_3.center = VC.view.center;
        
        VC.view_3.transform = CGAffineTransformRotate(VC.view_3.transform, M_PI);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            //[UIView setAnimationDelay:20];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            VC.view_3.center = VC.point;
            VC.view_3.transform = CGAffineTransformRotate(VC.view_3.transform, M_PI);
            TopForHeroController * TVC = [[TopForHeroController alloc] init];
            TVC.number = 1;
            
            [self.navigationController pushViewController:TVC animated:YES];
            
        } completion:nil];
        
        
    }];
    
}

- (IBAction)but_4:(UIButton *)sender {
    __weak KindViewController * VC = self;
    [UIView animateWithDuration:0.5 animations:^{
         VC.point = VC.view_4.center;
        //对视图动画和视图属性进行设置
        [UIView setAnimationRepeatCount:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:YES];
        VC.view_4.center = VC.view.center;
        
        VC.view_4.transform = CGAffineTransformRotate(VC.view_4.transform, M_PI);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            //[UIView setAnimationDelay:20];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            VC.view_4.center = VC.point;
            VC.view_4.transform = CGAffineTransformRotate(VC.view_4.transform, M_PI);
         
            
        } completion:nil];
        
        BestGroupTableViewController * BVC = [[BestGroupTableViewController alloc] init];
        
        [self.navigationController pushViewController:BVC animated:YES];
    }];
}
@end
