//
//  VideoRootViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "VideoRootViewController.h"

@interface VideoRootViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
- (IBAction)typeButton:(UIButton *)sender;
- (IBAction)latestButton:(UIButton *)sender;
- (IBAction)RankButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *videoScrollView;
@end

@implementation VideoRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videoScrollView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)typeButton:(UIButton *)sender {
    self.videoScrollView.contentOffset = CGPointMake(self.videoScrollView.frame.size.width * 0, 0);
    self.sliderLabel.frame = CGRectMake((self.view.frame.size.width / 3)*0, self.sliderLabel.frame.origin.y, self.sliderLabel.frame.size.width, self.sliderLabel.frame.size.height);
}

- (IBAction)latestButton:(UIButton *)sender {
    self.videoScrollView.contentOffset = CGPointMake(self.videoScrollView.frame.size.width * 1, 0);
    self.sliderLabel.frame = CGRectMake((self.view.frame.size.width / 3)*1, self.sliderLabel.frame.origin.y, self.sliderLabel.frame.size.width, self.sliderLabel.frame.size.height);
}

- (IBAction)RankButton:(UIButton *)sender {
    self.videoScrollView.contentOffset = CGPointMake(self.videoScrollView.frame.size.width * 2, 0);
    self.sliderLabel.frame = CGRectMake((self.view.frame.size.width / 3)*2, self.sliderLabel.frame.origin.y, self.sliderLabel.frame.size.width, self.sliderLabel.frame.size.height);
}

//滑动scrollerView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%lf",scrollView.contentOffset.x);
//    self.lineLabel.frame = CGRectMake( scrollView.contentOffset.x / 4
//                                      , self.lineLabel.frame.origin.y, self.lineLabel.frame.size.width, self.lineLabel.frame.size.height);
    
    self.sliderLabel.frame = CGRectMake(self.videoScrollView.contentOffset.x / 3, self.sliderLabel.frame.origin.y, self.sliderLabel.frame.size.width, self.sliderLabel.frame.size.height);
}

@end
