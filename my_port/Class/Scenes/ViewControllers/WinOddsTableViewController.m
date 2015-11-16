//
//  WinOddsTableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "WinOddsTableViewController.h"
#import "WinOddsModel.h"
#import "UIImageView+WebCache.h"
#import "WinsOddsTableViewCell.h"
#import "HeroDetailViewController.h"
@interface WinOddsTableViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong)NSMutableArray * winsArray;
@end

@implementation WinOddsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"每周一0点更新";
    [self.tableView registerNib:[UINib nibWithNibName:@"WinsOddsTableViewCell" bundle:nil] forCellReuseIdentifier:@"WinsCell"];
    self.tableView.rowHeight = 40;
    NSURL * url = [NSURL URLWithString:KWinOdds];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    
    [_HUD showAnimated:YES whileExecutingBlock:^{
        __weak WinOddsTableViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                
            
            // 2. 解析数据
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.winsArray = [NSMutableArray array];
            
            for (NSDictionary * dic in array) {
                WinOddsModel * temp = [WinOddsModel new];
                [temp setValuesForKeysWithDictionary:dic];
                [TempVC.winsArray addObject:temp];
            }
            
            [_winsArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                WinOddsModel * temp1 = obj1;
                WinOddsModel * temp2 = obj2;
                return temp1.winRate < temp2.winRate;
            }];
            
            [TempVC.tableView reloadData];
            }
        }];
        
    } completionBlock:^{
        //操作执行完后取消对话框
        [_HUD removeFromSuperview];
        _HUD = nil;
    }];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _winsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
WinsOddsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WinsCell"];
   
    WinOddsModel * w = _winsArray[indexPath.row];
    cell.introduceLabel.text = [NSString stringWithFormat:@"%.2lf", w.presentRate];
    cell.winsLabel.text = [NSString stringWithFormat:@"%.2lf", w.winRate];
    cell.chuchang.text = [NSString stringWithFormat:@"%.0f", w.totalPresent];
    
    [cell.HeroPic sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(w.nameUS)]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView  * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 30)];
  
    UILabel * heroname = [[UILabel alloc] initWithFrame:CGRectMake(7, 10, 35, 25)];
    heroname.text = @"英雄";
    heroname.textColor = [UIColor blueColor];
    //heroname.font = [UIFont fontWithName:nil size:14];
    [view addSubview:heroname];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(63, 10, 75, 25);
    [button setTitle:@"出场率(升)" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor blueColor];
    [button addTarget:self action:@selector(changeChuchang:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
     UIButton * button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(155, 10, 65, 25);
    [button1 setTitle:@"胜率(升)" forState:UIControlStateNormal];
    button1.titleLabel.textColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(winRateOfHero:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    UILabel * Number = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame)-90, 10, 70, 25)];
    Number.text = @"出场次数";
    Number.textColor = [UIColor blueColor];
    //heroname.font = [UIFont fontWithName:nil size:14];
    [view addSubview:Number];
    
    
    view.backgroundColor  = [UIColor whiteColor];
    return view;
}
- (void)changeChuchang:(UIButton *)sender
{
   
[_winsArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    WinOddsModel * temp1 = obj1;
    WinOddsModel * temp2 = obj2;
    return temp1.presentRate < temp2.presentRate;
}];
    
    [self.tableView reloadData];
}
- (void)winRateOfHero:(UIButton *)sender
{
  
    [_winsArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    WinOddsModel * temp1 = obj1;
    WinOddsModel * temp2 = obj2;
    return temp1.winRate < temp2.winRate;
}];
    
    [self.tableView reloadData];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];  /////指的是Main.storyboard
    HeroDetailViewController *leftController = [mainStoryboard instantiateViewControllerWithIdentifier:@"herodetail_ID"];
  WinOddsModel * w = _winsArray[indexPath.row];
    leftController.HeroName = w.nameUS;
    [self.navigationController pushViewController:leftController animated:YES];
}
@end
