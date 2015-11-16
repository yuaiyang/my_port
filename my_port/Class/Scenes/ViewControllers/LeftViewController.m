//
//  LeftViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "LeftViewController.h"
#import "ClearCacheHandle.h"
#import "AppDelegate.h"
#import "AboutViewController.h"
#import "userShareController.h"
@interface LeftViewController ()

@property (nonatomic, strong)UITableView * tableView;

@property (nonatomic, strong)UITabBarController * tabbar;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tabbar = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 4) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    [self.tableView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"Left_Cell"];
    [self.view addSubview:self.tableView];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            _tabbar.selectedIndex = 0;
            [self.sideMenuViewController setContentViewController:_tabbar];
            [self.sideMenuViewController hideMenuViewController];
            break;
        }
        case 1: {
            float data = [[ClearCacheHandle sharedManager] folderSizeAtPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]];
            NSString * titleString = [NSString stringWithFormat:@"为你清理缓存%.2fM", data];
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:titleString message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alertView show];
            [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:2.f];
            
            [[ClearCacheHandle sharedManager] clearCache];
            
            break;
        }
            
        case 2:{


            NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
             
            if (![user boolForKey:@"isNight"]) {
                [[UIApplication sharedApplication].delegate window].alpha = 0.4;
                [user setBool:YES forKey:@"isNight"];
                [self.tableView reloadData];
            }else {
                [[UIApplication sharedApplication].delegate window].alpha = 1;
                [user setBool:NO forKey:@"isNight"];
                [self.tableView reloadData];
            }
            
           
            break;

        }
        case 3:{
            UIStoryboard * board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            AboutViewController * AVC = [board instantiateViewControllerWithIdentifier:@"About_ID"];
             AVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            
            [self presentViewController:AVC animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
            cell.selectedBackgroundView = [[UIView alloc] init];
        }
        
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        if ([user boolForKey:@"isNight"]) {
            NSArray *titles = @[@"Home", @"         清除缓存",@"         正常模式", @"         关于我们"];
            cell.textLabel.text = titles[indexPath.row];
        }else{
            
            NSArray *titles = @[@"Home", @"         清除缓存",@"         开启护眼模式", @"         关于我们"];
            cell.textLabel.text = titles[indexPath.row];
        }
    
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"Home"];
    }
        return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissAlerView:(UIAlertView *)alertView {
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

@end
