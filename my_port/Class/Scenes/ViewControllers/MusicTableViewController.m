//
//  MusicTableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "MusicTableViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface MusicTableViewController ()
@property (nonatomic,strong)NSMutableArray * musicArray;
@property (nonatomic, strong)AVPlayer * AVPLayer;
@property (nonatomic, strong) UIBarButtonItem * CollectBtn;
@end

@implementation MusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"点击播放英雄音效";
    
    self.CollectBtn = [[UIBarButtonItem alloc] initWithTitle:@"其他声音" style:UIBarButtonItemStylePlain target:self action:@selector(didClickCollectBtn)];
    self.navigationItem.rightBarButtonItem = _CollectBtn;
    
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self requestData];
        
        // 进入刷新状态后会自动调用这个block
        [self.tableView.header endRefreshing];
    }];
    [self requestData];
    
}
- (void)requestData
{
    NSURL * url = [NSURL URLWithString:Kmusic(self.heroName)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    __weak MusicTableViewController * TempVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            // 2. 解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.musicArray = [NSMutableArray array];
            
            for (NSString * dic in dict) {
                
                [TempVC.musicArray addObject:dic];
            }
            
        }
        [TempVC.tableView reloadData];
        
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
    return _musicArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MusicCell"];
    }
    
    NSArray * array = [_musicArray[indexPath.row] componentsSeparatedByString:@"_"];
    
    cell.textLabel.text = array.lastObject;
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.AVPLayer = [[AVPlayer alloc] init];
    
    NSString * MP3Url = [_musicArray[indexPath.row] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([_CollectBtn.title isEqualToString:@"英雄声音"]) {
        AVPlayerItem * item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:KvoiceOfOther(MP3Url)]];
        [_AVPLayer replaceCurrentItemWithPlayerItem:item];
        
        [_AVPLayer play];
    }else{
    AVPlayerItem * item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:Kvoice(_heroName, MP3Url)]];
    
    [_AVPLayer replaceCurrentItemWithPlayerItem:item];
    
        [_AVPLayer play];
    }
}

- (void)didClickCollectBtn
{
    if ([_CollectBtn.title isEqualToString:@"其他声音"]) {
        self.CollectBtn.title = @"英雄声音";
    
        NSURL * url = [NSURL URLWithString:KOthervoic];
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
        __weak MusicTableViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            // 2. 解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.musicArray = [NSMutableArray array];
            
            for (NSString * dic in dict) {
                
                [TempVC.musicArray addObject:dic];
            }
            
            
            [TempVC.tableView reloadData];
            
        }];
    }else{
  
        self.CollectBtn.title = @"其他声音";
        NSURL * url = [NSURL URLWithString:Kmusic(_heroName)];
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
        __weak MusicTableViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            // 2. 解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.musicArray = [NSMutableArray array];
            
            for (NSString * dic in dict) {
                
                [TempVC.musicArray addObject:dic];
            }
            
            
            [TempVC.tableView reloadData];
            
        }];
    
    
    }
}
-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    [self.AVPLayer pause];
}
@end
