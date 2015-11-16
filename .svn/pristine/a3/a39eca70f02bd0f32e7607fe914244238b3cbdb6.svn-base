//
//  NewTableViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "NewTableViewController.h"
#import "NewModelList.h"
#import "MessageTableViewCell.h"
#import "NewDetailViewController.h"
#import "Masonry.h"

@interface NewTableViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic , strong)  NSMutableArray * allImageArray;//存放所有轮播图信息的数组

@property (nonatomic , strong) NSMutableArray * allTitleArray;//存放轮播图标题的数组

@property (nonatomic , strong) NSMutableArray * allNewsArray;//存放所有数据的数组

@property (nonatomic , assign) int number;//判断是上拉加载还是下拉刷新

@property (nonatomic , assign) int kcount;

@property (nonatomic, assign) int count;

@property (nonatomic , strong) NSURL * url;
@property (weak, nonatomic) IBOutlet UIView *aView;

@end

@implementation NewTableViewController
- (NSMutableArray *)allTitleArray
{
    if (!_allTitleArray) {
        _allTitleArray = [NSMutableArray array];
    }
    return _allTitleArray;
}
- (NSMutableArray *)allImageArray
{
    if (!_allImageArray) {
        _allImageArray = [NSMutableArray array];
    }
    return _allImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"最新";
    
     self.allNewsArray = [NSMutableArray array];
//    [self reloadingData];
     [self.tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];
    self.aView.frame = CGRectMake(0, 0, self.self.view.frame.size.width, self.view.frame.size.height/4);
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
        _count = 471;
    }else{
        _count -= 1;
    }
    
    [self reloadingData];
    
}



- (void)reloadingData
{
    NSURL * url = [NSURL URLWithString:kNewImageViewURL];//轮播图
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    if (_kcount <= 3) {
        self.url = [NSURL URLWithString:kNewURL(self.kcount)];
    }else{
        self.url = [NSURL URLWithString:kNewURLRefresh(self.count)];
    }
  
    NSURLRequest * request1 = [NSURLRequest requestWithURL:_url];//请求tabelView上的数据

    __weak NewTableViewController * weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

                if (weakSelf.allImageArray) {
                    [weakSelf.allImageArray removeAllObjects];
                }
            for (NSDictionary * dic in dict[@"list"]) {
                NewModelList * model = [[NewModelList alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [weakSelf.allImageArray addObject:model];
            }
        }
        [self createScrollview];
        [self.tableView reloadData];
    }];

    [NSURLConnection sendAsynchronousRequest:request1 queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            NSError * error = nil;
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

            if (0 == _number) {
                if (weakSelf.allNewsArray) {
                    [weakSelf.allNewsArray removeAllObjects];
                }
            }
            for (NSDictionary * dic in dict[@"list"]) {
                NewModelList * model = [[NewModelList alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.allNewsArray addObject:model];
            }
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
    }];

}


- (void)createScrollview
{
    // 采用网络图片实现
    NSMutableArray * ImageArray = [NSMutableArray array];
    for (id dic in self.allImageArray) {
        NewModelList * model = [[NewModelList alloc] init];
        model = dic;
        [ImageArray addObject:model.image_url_big];
        [self.allTitleArray addObject:model.title];
    }
    NSArray *imagesURLStrings = ImageArray;
    // 图片配文字
    NSArray *titles = self.allTitleArray;
//    CGFloat w = self.view.frame.size.width;
    //网络加载 --- 创建带标题的图片轮播器
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 180) imageURLStringsGroup:nil];
    SDCycleScrollView *cycleScrollView = [[SDCycleScrollView alloc] init];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.delegate = self;
    cycleScrollView.titlesGroup = titles;
    cycleScrollView.dotColor = [UIColor cyanColor]; // 自定义分页控件小圆标颜色
    [self.view addSubview:cycleScrollView];
    
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.left.and.top.equalTo(self.view);
        make.height.mas_equalTo(self.aView.frame.size.height - 1);
    }];
    
    cycleScrollView.autoScrollTimeInterval = 2.0;
    if (_allImageArray.count < 2) {
        cycleScrollView.autoScrollTimeInterval = 0.0;
    }
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait; //屏幕可以旋转
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    [self turnToDetailVC:self.allImageArray[index]];
}

- (void)turnToDetailVC:(NewModelList *)model
{
    NewDetailViewController * detailVC = [[NewDetailViewController alloc] init];
    detailVC.model = model;
    [self.navigationController pushViewController:detailVC animated:YES];
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
    return self.allNewsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell" forIndexPath:indexPath];
    MessageListModel * modle = [[MessageListModel alloc] init];
    modle = self.allNewsArray[indexPath.row];
    cell.modle = modle;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self turnToDetailVC:self.allNewsArray[indexPath.row]];
}

@end
