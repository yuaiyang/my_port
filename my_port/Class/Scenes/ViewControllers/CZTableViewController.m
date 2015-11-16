//
//  CZTableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "CZTableViewController.h"
#import "CZModel.h"
#import "CZDetailViewController.h"
@interface CZTableViewController ()
@property (nonatomic, strong)NSMutableArray * CZArray;
@end

@implementation CZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestData];
        // 进入刷新状态后会自动调用这个block
        [self.tableView.header endRefreshing];
    }];
    
    self.title = @"点击出装查看详情";
    
    [self requestData];
    
}
- (void)requestData
{
    NSURL * url = [NSURL URLWithString:KChuZhuang(_heroName)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    __weak CZTableViewController * TempVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 2. 解析数据
        NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        TempVC.CZArray = [NSMutableArray array];
        
        for (NSDictionary * dic in array) {
            CZModel * temp = [CZModel new];
            [temp setValuesForKeysWithDictionary:dic];
            [TempVC.CZArray addObject:temp];
        }
        
        [TempVC.tableView reloadData];
        
    }];



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _CZArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    CZModel * z = _CZArray[indexPath.row];
    cell.textLabel.text = z.title;
  //  cell.textLabel.text = [NSString stringWithFormat:@"%@  作者:%@(%@)",z.title, z.author, z.server];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZModel * z = _CZArray[indexPath.row];

    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];  /////指的是Main.storyboard
    CZDetailViewController *leftController = [mainStoryboard instantiateViewControllerWithIdentifier:@"CZview_ID"];
    leftController.CZ_model =z;
    leftController.hero_Name = _heroName;
    
    [self.navigationController pushViewController:leftController animated:YES];
    
    
}

@end
