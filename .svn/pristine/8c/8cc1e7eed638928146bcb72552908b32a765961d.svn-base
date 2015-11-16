//
//  CategoryViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategroyOfKindModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "CategoryCollectionViewCell.h"
#import "CateGroyDetailableViewController.h"
@interface CategoryViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableArray * CateGroyArray;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"点击装备查看详情";
    
      [self creatCollectionView];
    // 下拉刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.collectionView.header endRefreshing];
    }];
    
    //self.view.backgroundColor = [UIColor whiteColor];
  
    [self.collectionView registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cateGoryCell"];
    
    
    
    NSURL * url = [NSURL URLWithString:KCategoryDetail(self.tag)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    [_HUD showAnimated:YES whileExecutingBlock:^{
        __weak CategoryViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                
            
            // 2. 解析数据
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            TempVC.CateGroyArray = [NSMutableArray array];
            
            for (NSDictionary * dic in array) {
                CategroyOfKindModel * temp = [CategroyOfKindModel new];
                [temp setValuesForKeysWithDictionary:dic];
                [TempVC.CateGroyArray addObject:temp];
            }
            
            [TempVC.collectionView reloadData];
            }
        }];

    } completionBlock:^{
        [_HUD removeFromSuperview];
        _HUD = nil;
    }];
    
    // Do any additional setup after loading the view from its nib.
}
//创建 colloectionView时  一定有指定的布局方式（UICollectionViewLayout）
- (void)creatCollectionView
{
    //创建布局方式对象
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个item的大小
   // layout.itemSize = CGSizeMake(80, 80);
    //设置列间的最小间距
    layout.minimumInteritemSpacing = 5;
    //设置行间的最小间距
    layout.minimumLineSpacing = 0;
    //设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(10, 15, 0, 15);
#pragma mark----设置区头的大小
    //1.重用集合中去取->注册->设置大小
    layout.headerReferenceSize = CGSizeMake(30, 0);
    layout.footerReferenceSize = CGSizeMake(30, 0);
    //创建集合视图   并指定布局方式
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    //设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //NSLog(@"%@", [UIFont familyNames]);
    //添加视图
    [self.view addSubview:_collectionView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-----实现UICollectionViewDataSource和UICollectionViewDelegate中的方法
//设置某个分区有多少个 item(cell)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _CateGroyArray.count;
}
//设置有多少个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
//设置  item(cell)上显示什么
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cateGoryCell" forIndexPath:indexPath];
    CategroyOfKindModel * c = _CateGroyArray[indexPath.row];
    
    cell.CategoryButoon.userInteractionEnabled = NO;
    [cell.CategoryButoon sd_setBackgroundImageWithURL:[NSURL URLWithString:KCategoryPic((long)c.id)] forState:UIControlStateNormal];
    cell.CategroyName.text = c.text;
    
    return cell;
}
#pragma make-----实现UICollectionViewDelegateFlowLayout中的方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section == 0 && indexPath.row == 0) {
    //        return CGSizeMake(200, 200);
    //    }
    
    return CGSizeMake(375/5-5, 85);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategroyOfKindModel * cate = _CateGroyArray[indexPath.row];
    CateGroyDetailableViewController * detailVC = [[CateGroyDetailableViewController alloc] init];
    
    detailVC.ID_Number = cate.id;
    [self.navigationController pushViewController:detailVC animated:YES];

}
@end
