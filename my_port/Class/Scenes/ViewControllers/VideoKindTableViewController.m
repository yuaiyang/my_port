//
//  VideoKindTableViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "VideoKindTableViewController.h"
#import "TheLatestVideoTableViewCell.h"
#import "TheLatestVideo.h"
#import <MediaPlayer/MediaPlayer.h>

#import "AFNetworking.h"

@interface VideoKindTableViewController ()

@property (nonatomic, strong)NSMutableArray * latestArray; // 用来存放所有最新视频对象
@property(nonatomic ,assign)NSInteger Kcount;

// 视频播放器
@property(nonatomic ,strong)MPMoviePlayerViewController *player;

@property(nonatomic ,strong)NSMutableArray *playArray;

@property(nonatomic ,assign)NSInteger acount;


@end

@implementation VideoKindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册cell
    UINib * nib = [UINib nibWithNibName:@"TheLatestVideoTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TheLatestVideoTableViewCell"];
    
    //  下拉刷新 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的reloadNewData方法）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewData)];
    // 开始刷新
    [self.tableView.header beginRefreshing];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    // 上划刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    

}

-(void)reloadNewData
{
    self.Kcount = 1;
    // 调用网络请求的方法
    [self sendLatestVideoDataRequset];
    [self.tableView.header endRefreshing];
}

-(void)loadMoreData
{
    self.Kcount+=1;
  
    [self sendLatestVideoDataRequset];
    [self.tableView.footer endRefreshing];
}

- (void)sendLatestVideoDataRequset
{
    // 网址请求
    NSURL * url = [NSURL URLWithString:KindDetailVideo(self.ModelTag,(long)self.Kcount)];
    // 请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    // 链接对象
    __weak VideoKindTableViewController * latestTVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            // 进行数据解析
            NSMutableArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //            NSLog(@"%@", array);
            for (NSDictionary * dic in array) {
                TheLatestVideo * latestVideo = [[TheLatestVideo alloc] init];
                [latestVideo setValuesForKeysWithDictionary:dic];
                [latestTVC.latestArray addObject:latestVideo];
            }
        }
        // 刷新数据
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

      return _latestArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TheLatestVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TheLatestVideoTableViewCell" forIndexPath:indexPath];
    TheLatestVideo * model = [[TheLatestVideo alloc] init];
    model = self.latestArray[indexPath.row];
    cell.latestVideo = model;
    
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

- (NSMutableArray *)latestArray
{
    if (!_latestArray) {
        _latestArray = [NSMutableArray array];
    }
    return _latestArray;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     PlayViewController *playVC = [[PlayViewController alloc]init];
    TheLatestVideo *model = self.latestArray[indexPath.row];
    playVC.vid = model.vid;
    
    [self.navigationController pushViewController:playVC animated:YES];
     */
    [self contentNetworkStatusByAFNetworking];
 
    TheLatestVideo *model = self.latestArray[indexPath.row];
    [self url:model.vid];

}


-(void)url:(NSString *)vid
{
    
    // 网址请求
    NSURL * url = [NSURL URLWithString:Kplayurl(vid)];
    // 请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    // 链接对象
    __weak VideoKindTableViewController * latestTVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data != nil) {
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableDictionary *dict =dic[@"result"];
            NSMutableDictionary *dicItems = dict[@"items"];
            NSMutableDictionary *dictt = dicItems[@"350"];
            NSMutableDictionary *dicTranscode = dictt[@"transcode"];
            latestTVC.playArray = dicTranscode[@"urls"];
            
            
        }
        [self playNativeMovie:latestTVC.playArray.firstObject];
    }];
    
}

/**播放视频*/
- (void)playNativeMovie:(NSString *)playUrlStr
{
    NSURL * url = [NSURL URLWithString:playUrlStr];
    
    // 播放路径
    self.player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    // 设置缩放类型
    _player.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    // 设置控制器类型 MPMovieControlStyleDefault MPMovieControlStyleFullscreen
    _player.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    
    // 设置播放源类型
    _player.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    
    [self.view addSubview:_player.view];
    
    // 设定播放画面的大小
    _player.view.frame = self.view.layer.bounds;
    
    // 模态化推出一个播放页面
//    [self presentMoviePlayerViewControllerAnimated:_player];
  
    [self showViewController:self.player sender:nil];
//      self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.player.navigationController.navigationBar.hidden = YES;
  
    // 使用通知对播放进行监控
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // 播放
    [_player.moviePlayer play];
    
}

/**播放完成*/
- (void)doFinished:(id)sender
{
    // 通知响应
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    self.player.navigationController.navigationBar.hidden = NO;
    [self.player.navigationController popViewControllerAnimated:NO];
    
    self.tabBarController.tabBar.hidden = NO;
   
    // 将播放视图从父视图移除
    [_player.view removeFromSuperview];
    
    // 将MPMoviePlayerViewController置空
    _player = nil;
    
}
#pragma mark - AFNetworking

- (void)contentNetworkStatusByAFNetworking {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable: {
                
                [self showAlertViewWithTitleString:@"请检查网络连接状态"];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                
                [self showAlertViewWithTitleString:@"当前网络连接状态:3G/4G"];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                
                [self showAlertViewWithTitleString:@"当前网络连接状态:WIFI"];
                break;
            }
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
- (void)showAlertViewWithTitleString:(NSString *)titleString {
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:titleString message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:1.f];
}

- (void)dismissAlerView:(UIAlertView *)alertView {
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
