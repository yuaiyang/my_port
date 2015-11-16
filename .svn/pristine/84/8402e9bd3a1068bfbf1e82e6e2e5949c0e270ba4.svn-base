//
//  BestGroupTableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "BestGroupTableViewController.h"
#import "BestGroupTableViewCell.h"
#import "BestGroupModel.h"
#import "UIImageView+WebCache.h"
#import "BestDetailViewController.h"
@interface BestGroupTableViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong) NSMutableArray * groupArray;
@end

@implementation BestGroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最佳阵容";
    [self.tableView registerNib:[UINib nibWithNibName:@"BestGroupTableViewCell" bundle:nil] forCellReuseIdentifier:@"BestCell"];
    
    self.tableView.rowHeight = 140;
    
    NSURL * url = [NSURL URLWithString:KBestGroup];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    __weak BestGroupTableViewController * TempVC = self;
    
    //初始化进度框，置于当前的View当中
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    
    //如果设置此属性则当前的view置于后台
    _HUD.dimBackground = YES;
    
    //设置对话框文字
    _HUD.labelText = @"Loading...";
    //细节文字
    _HUD.detailsLabelText = @"Please wait patiently";  // 显示请耐心等候
    //显示对话框
    [_HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                // 2. 解析数据
                NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                TempVC.groupArray = [NSMutableArray array];
                
                for (NSDictionary * dic in array) {
                    BestGroupModel * temp = [BestGroupModel new];
                    [temp setValuesForKeysWithDictionary:dic];
                    [TempVC.groupArray addObject:temp];
                }
                
                [TempVC.tableView reloadData];
            }
            
            
        }];
      // 在HUD被隐藏后的回调
    }completionBlock:^{
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
    return _groupArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BestGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BestCell" forIndexPath:indexPath];
    BestGroupModel * b = _groupArray[indexPath.row];
    cell.titleLabel.text = b.title;
    
    [cell.hero_1 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(b.hero1)]];
    [cell.hero_2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(b.hero2)]];
    [cell.hero_3 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(b.hero3)]];
    [cell.hero_4 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(b.hero4)]];
    [cell.hero_5 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(b.hero5)]];
    
    cell.desLabel.text = b.des;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];  /////指的是Main.storyboard
   BestDetailViewController *leftController = [mainStoryboard instantiateViewControllerWithIdentifier:@"best_ID"];
    BestGroupModel * b = _groupArray[indexPath.row];
    leftController.best_model = b;
    
    [self.navigationController pushViewController:leftController animated:YES];
    
    

}

@end
