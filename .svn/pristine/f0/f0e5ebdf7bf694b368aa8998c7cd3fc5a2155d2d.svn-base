//
//  FreeViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/20.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "FreeViewController.h"
#import "FreeModel.h"
#import "FreeHeroCell.h"
#import "HeroDetailViewController.h"
@interface FreeViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic , strong) NSMutableArray * freeHeroArray;
@end

@implementation FreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 下拉刷新
    self.CollectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self requestData];
        // 进入刷新状态后会自动调用这个block
        [self.CollectionView.header endRefreshing];
    }];
    
 
    [self requestData];
    
}
- (void)requestData
{
    NSURL * url = [NSURL URLWithString:Kfree];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    [_HUD showAnimated:YES whileExecutingBlock:^{
        __weak FreeViewController * LOLVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                // 2. 解析数据
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                LOLVC.freeHeroArray = [NSMutableArray array];
                for (NSDictionary * dic in dict[@"free"]) {
                    FreeModel * free = [FreeModel new];
                    [free setValuesForKeysWithDictionary:dic];
                    [LOLVC.freeHeroArray addObject:free];
                }
                // NSLog(@"%@", LOLVC.freeHeroArray);
                [LOLVC.CollectionView reloadData];
            }
        }];
    } completionBlock:^{
        [_HUD removeFromSuperview];
        _HUD = nil;
    }];
    
    
    
    //设置代理
    _CollectionView.delegate = self;
    _CollectionView.dataSource = self;
    //添加视图
    [self.view addSubview:_CollectionView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置某个分区有多少个 item(cell)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _freeHeroArray.count;
}
//设置有多少个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
//设置  item(cell)上显示什么
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FreeHeroCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LOLCell" forIndexPath:indexPath];
#pragma mark---设置cell 上显示的图片的方法
    FreeModel * f= self.freeHeroArray[indexPath.row];
    [cell.heroImgView sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(f.enName)]];
    cell.cn_name.text = f.title;
    cell.ni_name.text = f.cnName;
    cell.location.text = [f.location stringByReplacingOccurrencesOfString:@"," withString:@"/"];
    return cell;
    
}
#pragma make-----实现UICollectionViewDelegateFlowLayout中的方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(self.view.frame.size.width/2-20, 60);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];  /////指的是Main.storyboard
    HeroDetailViewController *leftController = [mainStoryboard instantiateViewControllerWithIdentifier:@"herodetail_ID"];
   FreeModel * f= self.freeHeroArray[indexPath.row];
    leftController.HeroName = f.enName;
    [self.navigationController pushViewController:leftController animated:YES];
}



@end
