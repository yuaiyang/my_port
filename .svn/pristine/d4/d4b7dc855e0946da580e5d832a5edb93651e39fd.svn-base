//
//  MessageTableViewController.m
//  Message_Box
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 杨文杰. All rights reserved.
//

#import "MessageTableViewController.h"
#import "MessageTableViewCell.h"
#import "MessageListModel.h"
#import "MessageDetailViewController.h"

@interface MessageTableViewController ()

@property (nonatomic , strong) NSMutableArray * messagesArray;//存放所有资讯数据

@property (nonatomic , assign) int number;//判断是上拉加载还是下拉刷新

@property (nonatomic , assign) int kcount;

@property (nonatomic, assign) int count;

@property (nonatomic , strong) NSURL * url;
@end

@implementation MessageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.kcount = 1;
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];

    [self refreshViewHeader];//下拉刷新
    
    [self refreshViewFooter];//上拉加载
}

//下拉刷新
- (void)refreshViewHeader
{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
}

- (void)loadNewData
{
    self.number = 0;
    self.kcount = 1;
    [self reloadingData];
    
   
}

//上拉加载
- (void)refreshViewFooter
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
}
- (void)loadMoreData
{
    self.number = 1;
    if (_kcount <=3) {
        self.kcount += 1;
        switch (self.a_id) {
            case 73:{
                //赛事
                self.count = 113;
                break;
            }
            case 3:{
                //官方
                self.count = 51;
                break;
            }
            case 10:{
                //攻略
                self.count = 43;
                break;
            }
            case 23:{
                //活动
                self.count = 2;
                break;
            }
            case 18:{
                //娱乐
                self.count = 48;
                break;
            }

            default:
                break;
        }
    }else{
        _count -= 1;
    }
    
    [self reloadingData];
    
}



- (void)reloadingData
{
    if (self.kcount <= 3) {
        self.url = [NSURL URLWithString:kMessageURL((long)self.a_id,self.kcount)];
    }else{
        self.url = [NSURL URLWithString:kMessageURLRefesh((long)self.a_id,self.count)];
      
    }
    
    NSURLRequest * request = [NSURLRequest requestWithURL:_url];
    
    __weak MessageTableViewController * weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (0 == _number) {
                if (weakSelf.messagesArray) {
                    [weakSelf.messagesArray removeAllObjects];
                }
            }
            for (NSDictionary * dic in dict[@"list"]) {
                MessageListModel * model = [[MessageListModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [weakSelf.messagesArray addObject:model];
            }
             [self.tableView.header endRefreshing];
             [self.tableView.footer endRefreshing];
        }
        
         [self.tableView reloadData];
        
       
    }];
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
    return self.messagesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell" forIndexPath:indexPath];
    MessageListModel * modle = [[MessageListModel alloc] init];
    modle = self.messagesArray[indexPath.row];
    cell.modle = modle;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageDetailViewController * detailVC = [[MessageDetailViewController alloc] init];
    MessageListModel * modle = [[MessageListModel alloc] init];
    modle = self.messagesArray[indexPath.row];
    detailVC.model = modle;
    UINavigationController * NVC = [[UINavigationController alloc] initWithRootViewController:detailVC];
    [self presentViewController:NVC animated:NO completion:nil];
}

- (NSMutableArray *)messagesArray
{
    if (!_messagesArray) {
        _messagesArray = [NSMutableArray array];
    }
    return _messagesArray;
}



@end
