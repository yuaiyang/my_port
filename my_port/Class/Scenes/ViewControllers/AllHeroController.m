//
//  AllHeroController.m
//  NO_2
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "AllHeroController.h"
#import "FreeModel.h"
#import "AllHeroCell.h"
#import "HeroDetailViewController.h"
@interface AllHeroController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong)NSMutableArray * AllHeroArray;
@property (nonatomic, strong)NSMutableArray * TempAllHeroArray;
@property (nonatomic, strong)NSArray * testArray;

@end

@implementation AllHeroController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 下拉刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      
        [self requestData];
        // 进入刷新状态后会自动调用这个block
        [self.collectionView.header endRefreshing];
        
    }];
    
    self.testArray = @[ @[@"类型", @"射手", @"战士", @"法师", @"刺客", @"坦克" , @"辅助"], @[@"定位", @"上单", @"中单", @"ADC", @"打野", @"辅助"], @[@"属性(升序排列)", @"物攻", @"防御", @"法伤",@"难度", @"点卷", @"金币"] ];
    
    
    MXPullDownMenu *menu = [[MXPullDownMenu alloc] initWithArray:_testArray selectedColor:[UIColor greenColor] lenght:self.view.frame.size.width];
    menu.delegate = self;
    menu.frame = CGRectMake(0, 0, menu.frame.size.width, menu.frame.size.height);
    [self.view addSubview:menu];
    
    
    [self requestData];
    

}
- (void)requestData
{

    NSURL * url = [NSURL URLWithString:Kall];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    [_HUD showAnimated:YES whileExecutingBlock:^{
        __weak AllHeroController * AllVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                
                
                // 2. 解析数据
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                AllVC.TempAllHeroArray = [NSMutableArray array];
                AllVC.AllHeroArray = [NSMutableArray array];
                
                for (NSDictionary * dic in dict[@"all"]) {
                    FreeModel * free = [FreeModel new];
                    [free setValuesForKeysWithDictionary:dic];
                    [AllVC.AllHeroArray addObject:free];
                    [AllVC.TempAllHeroArray addObject:free];
                }
                
                
                [AllVC.collectionView reloadData];
            }
        }];
        
    } completionBlock:^{
        [_HUD removeFromSuperview];
        _HUD = nil;
    }];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //NSLog(@"%@", [UIFont familyNames]);
    //添加视图
    [self.view addSubview:_collectionView];
    
    self.view.backgroundColor = [UIColor whiteColor];


}
//设置某个分区有多少个 item(cell)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _AllHeroArray.count;
}
//设置有多少个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
//设置  item(cell)上显示什么
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AllHeroCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AllCell" forIndexPath:indexPath];

#pragma mark---设置cell 上显示的图片的方法
    FreeModel * f= self.AllHeroArray[indexPath.row];
    [cell.heroPicView sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(f.enName)]];
    
    cell.Big_Name.text = f.title;
  
    return cell;
    
}
#pragma make-----实现UICollectionViewDelegateFlowLayout中的方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    return CGSizeMake(65, 90);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];  /////指的是Main.storyboard
    HeroDetailViewController *leftController = [mainStoryboard instantiateViewControllerWithIdentifier:@"herodetail_ID"];
        FreeModel * f= self.AllHeroArray[indexPath.row];
        leftController.HeroName = f.enName;
    [self.navigationController pushViewController:leftController animated:YES];
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row
{

   NSString * string = self.testArray[column][row];
    if (column == 0) {
        [_AllHeroArray removeAllObjects];
    
        for (FreeModel * temp in _TempAllHeroArray) {
           
            if ([temp.kind isEqualToString:string]) {
                [_AllHeroArray addObject:temp];
            }
            
        }
        if (row == 0) {
            [_AllHeroArray addObjectsFromArray:_TempAllHeroArray];
        }
        [self.collectionView reloadData];
    }else if (column == 1){
        [_AllHeroArray removeAllObjects];
        for (FreeModel * temp in _TempAllHeroArray) {
            if ([temp.location rangeOfString:string].length != 0) {
                [_AllHeroArray addObject:temp];
            }
        }
        if (row == 0) {
            [_AllHeroArray addObjectsFromArray:_TempAllHeroArray];
        }
       [self.collectionView reloadData]; 
    }else{
        if (0 < row && row <= 4) {
            [_AllHeroArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                FreeModel * temp1 = obj1;
                FreeModel * temp2 = obj2;
                NSArray * array1 = [temp1.rating componentsSeparatedByString:@","];
                NSArray * array2 = [temp2.rating componentsSeparatedByString:@","];
                return [array1[row-1] integerValue] < [array2[row-1] integerValue];
            }];
            [self.collectionView reloadData];
        }else if (4 < row && row <= 6){
        
            [_AllHeroArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                FreeModel * temp1 = obj1;
                FreeModel * temp2 = obj2;
                NSArray * array1 = [temp1.price componentsSeparatedByString:@","];
                NSArray * array2 = [temp2.price componentsSeparatedByString:@","];
                
                  return [array1[row - 5] integerValue] < [array2[row - 5] integerValue];
            }];
        [self.collectionView reloadData];
        }else{
            [_AllHeroArray removeAllObjects];
        [_AllHeroArray addObjectsFromArray:_TempAllHeroArray];
        [self.collectionView reloadData];
        }
    }

}


@end
