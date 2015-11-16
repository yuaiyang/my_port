//
//  CategoryTableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "CategoryModel.h"
#import "CategoryViewController.h"
@interface CategoryTableViewController ()
@property (nonatomic, strong)NSMutableArray * KindOfCategory;
@end

@implementation CategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"点击查看分类装备";
    NSURL * url = [NSURL URLWithString:KCategory];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    __weak CategoryTableViewController * TempVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            // 2. 解析数据
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.KindOfCategory = [NSMutableArray array];
            
            for (NSDictionary * dic in array) {
                CategoryModel * temp = [CategoryModel new];
                [temp setValuesForKeysWithDictionary:dic];
                [TempVC.KindOfCategory addObject:temp];
            }
            
            [TempVC.tableView reloadData];
        }
     
   
    }];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _KindOfCategory.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    CategoryModel * c = _KindOfCategory[indexPath.row];
    
    cell.textLabel.text = c.text;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryViewController * CVC = [[CategoryViewController alloc] init];
    CategoryModel * c = _KindOfCategory[indexPath.row];
    CVC.tag = c.tag;
    [self.navigationController pushViewController:CVC animated:YES];
}

@end
