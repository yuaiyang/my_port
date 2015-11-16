//
//  KindViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "VideoKindViewController.h"
#import "VideoKindCollectionViewCell.h"
#import "HeadCollectionReusableView.h"
#import "KindVideoGroupModel.h"
#import "KindVideoModel.h"
#import "VideoKindTableViewController.h"
#import "MBProgressHUD.h"

@interface VideoKindViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MBProgressHUDDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *KcollectionView;
- (IBAction)ButtonAction:(UIButton *)sender;



@property(nonatomic ,strong)NSMutableArray *groupArray;
@property(nonatomic ,strong)NSMutableArray *subCategory;
@property(nonatomic ,strong)NSArray *array;
@property(nonatomic ,strong)NSMutableArray *videoArray;

@property(nonatomic ,strong)KindVideoGroupModel *groupModel;
@property(nonatomic ,strong)KindVideoModel *videoModel;

@property(nonatomic ,strong)NSMutableArray *bigArray;

@property(nonatomic ,assign)BOOL hidden;

@property (nonatomic, strong)MBProgressHUD * HUD;
@end

@implementation VideoKindViewController

- (NSMutableArray *)subCategory {
    
    if (_subCategory == nil) {
        
        _subCategory = [NSMutableArray array];
    }
    return _subCategory;
}
- (NSMutableArray *)bigArray {
    
    if (_bigArray == nil) {
        
        _bigArray = [NSMutableArray array];
    }
    return _bigArray;
}

//- (NSMutableArray *)videoArray {
//    
//    if (_videoArray == nil) {
//        
//        _videoArray = [NSMutableArray array];
//    }
//    return _videoArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册collectionViewCell
    UINib *nib = [UINib nibWithNibName:@"VideoKindCollectionViewCell" bundle:nil];
    [self.KcollectionView registerNib:nib forCellWithReuseIdentifier:@"kindCollectionViewCell"];
    //注册区头
     UINib *headNib = [UINib nibWithNibName:@"HeadCollectionReusableView" bundle:nil];
   [self.KcollectionView registerNib:headNib forCellWithReuseIdentifier:@"headView"];

    [self MBProgressShow];
    [self requestURL];


    self.hidden = YES;
    self.KcollectionView.delegate = self;
    self.KcollectionView.dataSource = self;
    // Do any additional setup after loading the view.
}

-(void)MBProgressShow
{
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
        sleep(3);
    }// 在HUD被隐藏后的回调
       completionBlock:^{
           //操作执行完后取消对话框
           [_HUD removeFromSuperview];
           _HUD = nil;
       }];
    
}



-(void)requestURL
{
    AsynRequestHandle *handle = [[AsynRequestHandle alloc]initWithURLString:[NSString stringWithFormat:KindVideo] method:@"GET" paramter:nil];

    handle.delegate = self;
    
}

#pragma mark --- 实现网络请求协议中的方法
-(void)asynRequestHandle:(AsynRequestHandle *)requestHandle didSucceedWithData:(NSData *)data
{
    if (data != nil) {
        
        [self.HUD hide:YES];
        self.array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
   
        self.groupArray = [NSMutableArray array];
        
        for (NSMutableDictionary *dic in self.array) {
            
            self.groupModel = [[KindVideoGroupModel alloc]init];
            [self.groupModel setValuesForKeysWithDictionary:dic];

            [self.groupArray addObject:self.groupModel];
          
           
            self.subCategory = dic[@"subCategory"];
            self.videoArray = [NSMutableArray array];
            
            for (NSMutableDictionary *dict in self.subCategory) {
                
                self.videoModel = [[KindVideoModel alloc]init];
                [self.videoModel setValuesForKeysWithDictionary:dict];
                [self.videoArray addObject:self.videoModel];
                
                [self.KcollectionView reloadData];
            }
            
            [self.bigArray addObject:self.videoArray];
        }
      
        
        
    }
}

-(void)asynRequestHandle:(AsynRequestHandle *)requestHandle didFailedWithError:(NSError *)error
{
//    NSLog(@"%@",error);
  
}

#pragma mark----实现UICollectionViewDataSource和UICollectionDelegate 协议中的方法
// 分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.array.count;
}

// 设置某个分区有多少个Item（cell）
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 

//    return [self.array[section][@"subCategory"] count];
    
    switch (section) {
        case 0:
            return [self.array[section][@"subCategory"] count];

            break;
        case 1:
            if (self.hidden == NO) {
                return [self.array[section][@"subCategory"] count];
            }
            return 8;
            
            break;
        case 2:
            return [self.array[section][@"subCategory"] count];
            
            break;
        case 3:
            return [self.array[section][@"subCategory"] count];
            
            break;
            
        default:
            break;
    }
   
    
    return [self.array[section][@"subCategory"] count];
   
}


// 创建Item(cell)并设置其上显示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    VideoKindCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kindCollectionViewCell" forIndexPath:indexPath];
    KindVideoModel *model = self.bigArray[indexPath.section][indexPath.row];
    [cell fetchVideoModel:model];
    
    return cell;
    

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    VideoKindTableViewController *marketVC = [[VideoKindTableViewController alloc]init];
    VideoKindTableViewController * marketVC = [self.storyboard instantiateViewControllerWithIdentifier:@"videoVC_id"];
    
      KindVideoModel *model = self.bigArray[indexPath.section][indexPath.row];
    
    marketVC.ModelTag = model.tag;
    
    [self.navigationController pushViewController:marketVC animated:YES];
    
}

//头部高
/*- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        
//        return CGSizeMake(375, 115);
//    }
    return CGSizeMake(375, 25);
}*/


// 设置区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
//    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        HeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];

        [headerView sendSubviewToBack:headerView.hiddenButton];
        headerView.aaaLabel.text = [self.groupArray[indexPath.section] name];
        if ([headerView.aaaLabel.text isEqualToString:@"解说视频"]) {
            [headerView bringSubviewToFront:headerView.hiddenButton];
        
        }
       
        
        return  headerView;
        
    }
    

    
    return nil;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ButtonAction:(UIButton *)sender {

    if (self.hidden == YES) {
        self.hidden = NO;
       
        [self.KcollectionView reloadData];
    }else if (self.hidden == NO){
        
       self.hidden = YES;
         [self.KcollectionView reloadData];
    }

}



@end
