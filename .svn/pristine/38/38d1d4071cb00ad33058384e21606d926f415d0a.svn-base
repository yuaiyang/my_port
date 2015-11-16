//
//  RootViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "RootViewController.h"
#import "userShareController.h"
#import "user.h"
#import "UserLoginManager.h"
@interface RootViewController ()
- (IBAction)segmented:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *flash_view;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ((_scrollView.contentOffset.x/self.view.frame.size.width ) == 0) {
        
        self.segmentedControl.selectedSegmentIndex = 0;
    }else if ((_scrollView.contentOffset.x/self.view.frame.size.width ) == 1){
        
     self.segmentedControl.selectedSegmentIndex = 1;
    
    }else{
    
    
    self.segmentedControl.selectedSegmentIndex = 2;
    
    }
    

}
- (IBAction)segmented:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:{
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 0, 0);
            break;
        }
        case 1:{
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 1, 0);
            break;
        }
        case 2:{
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 2, 0);
            break;
        }
        default:
            break;
    }
    
    
    
}

- (IBAction)didClickRightBarButtonItem:(UIBarButtonItem *)sender {
   
  
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        userShareController * UVC = [storyboard instantiateViewControllerWithIdentifier:@"userColl_ID"];
        user * temp = [[UserLoginManager SharedInstance] getAuserByUserName:@"Root"];
        if (temp.heroNameArray.count) {
           
           [self.navigationController pushViewController:UVC animated:YES];
        }else{
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你目前还没有收藏任何英雄,快去收藏吧！" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            [alertView show];
            [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:1.3];
        }
}
- (void)dismissAlerView:(UIAlertView *)alertView {
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}
@end
