//
//  CateGroyDetailableViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "CateGroyDetailableViewController.h"
#import "CateDetailTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CategroyDetailModel.h"
@interface CateGroyDetailableViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong)CategroyDetailModel * CateModel;
@end

@implementation CateGroyDetailableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CateDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSURL * url = [NSURL URLWithString:KCategoryOfOne((long)self.ID_Number)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    [_HUD showAnimated:YES whileExecutingBlock:^{
        
        __weak CateGroyDetailableViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                
                
                // 2. 解析数据
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                
                TempVC.CateModel = [CategroyDetailModel new];
                [_CateModel setValuesForKeysWithDictionary:dict];
                
                [TempVC.tableView reloadData];
            }
        }];

        
    } completionBlock:^{
        [_HUD removeFromSuperview];
        _HUD = nil;
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CateDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];

    
    
    [cell.catePicView sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)_ID_Number)]];
    cell.NameLabel.text = _CateModel.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"价格:%ld 总价:%ld 售价:%ld", (long)_CateModel.price, (long)_CateModel.allPrice, (long)_CateModel.sellPrice];
    cell.introduceLael.text = _CateModel.in_description;
    cell.introduceLael.numberOfLines = 0;
    NSArray * array = [_CateModel.need componentsSeparatedByString:@","];
    for (int i = 0; i < array.count&& i < 6; i++) {
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(5*(i+1)+50*i, 5, 50, 50)];
        [img sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array[i] integerValue])]];
        [cell.needView addSubview:img];
    }
    NSArray * ComArray = [_CateModel.compose componentsSeparatedByString:@","];
    for (int i = 0;i < ComArray.count && i < 6; i++) {
      
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(5*(i+1)+50*i, 5, 50, 50)];
        [img sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[ComArray[i] integerValue])]];
        [cell.CompView addSubview:img];
    }
  
    return cell;
}




@end
