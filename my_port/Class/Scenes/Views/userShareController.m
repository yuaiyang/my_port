//
//  userShareController.m
//  my_port
//
//  Created by lanou3g on 15/11/2.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//
#import "UserLoginManager.h"
#import "userShareController.h"
#import "shareCell.h"
#import "HeroDetailViewController.h"
@interface userShareController ()
@property (nonatomic, assign)NSInteger number;
@end

@implementation userShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"shareCell" bundle:nil] forCellReuseIdentifier:@"shareCell_ID"];
    self.number = [UserLoginManager SharedInstance].user.heroNameArray.count;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [UserLoginManager SharedInstance].user.heroNameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shareCell_ID"];
    NSArray * array = [UserLoginManager SharedInstance].user.heroNameArray;
    
    if ([UserLoginManager SharedInstance].user.heroNameArray.count == 0) {
        cell.heroName.text = @"没有收藏";
    }else{
        [cell.heroPicView sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(array[indexPath.row])]];
        cell.heroName.text = [UserLoginManager SharedInstance].user.heroNameArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard * board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HeroDetailViewController * HVC = [board instantiateViewControllerWithIdentifier:@"herodetail_ID"];
    HVC.HeroName = [UserLoginManager SharedInstance].user.heroNameArray[indexPath.row];

    [self.navigationController pushViewController:HVC animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return YES;
}
//4.设置指定分区（section）的行（row）是什么类型的编辑样式（删除/插入）
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
        [[UserLoginManager SharedInstance].user.heroNameArray removeObjectAtIndex:indexPath.row];
        [[UserLoginManager SharedInstance] shoucang:nil];
        
       [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
