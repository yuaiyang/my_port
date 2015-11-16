//
//  DaohangViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "DaohangViewController.h"
#import "AppDelegate.h"

@interface DaohangViewController ()
- (IBAction)loginButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation DaohangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.buttonView bringSubviewToFront:self.loginButton];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(UIButton *)sender {
    UIStoryboard *stroy = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.draRootVC= stroy.instantiateInitialViewController;
    
    AppDelegate *appdele = [UIApplication sharedApplication].delegate;
    [appdele.window setRootViewController:self.draRootVC];
    
    NSUserDefaults *userdefauls = [NSUserDefaults standardUserDefaults];
    BOOL first = YES;
    [userdefauls setObject:[NSNumber numberWithBool:first] forKey:@"first"];

    
}
@end
