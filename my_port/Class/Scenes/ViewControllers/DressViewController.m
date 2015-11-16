//
//  DressViewController.m
//  my_port
//
//  Created by lanou3g on 15/11/2.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "DressViewController.h"
#import "dressModel.h"
@interface DressViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong)MBProgressHUD * HUD;
@property (nonatomic, strong) NSMutableArray * dressArray;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIAlertView * alertview;
@end

@implementation DressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL * url = [NSURL URLWithString:KdressOfHero(_HeroName)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"Loading...";
    _HUD.detailsLabelText = @"Please wait patiently";
    [_HUD showAnimated:YES whileExecutingBlock:^{
        
        __weak DressViewController * TempVC = self;
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                
                // 2. 解析数据
                NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                TempVC.dressArray = [NSMutableArray array];
                
                for (NSDictionary * dic in array) {
                    dressModel * temp = [dressModel new];
                    [temp setValuesForKeysWithDictionary:dic];
                    [TempVC.dressArray addObject:temp];
                }
                
                dressModel * d = _dressArray[0];
                self.index = 1;
                [self.dressView sd_setImageWithURL:[NSURL URLWithString:d.smallImg]];
                [self.dressView sd_setImageWithURL:[NSURL URLWithString:d.smallImg]];
                if (![d.price isEqualToString:@""] && ![d.price isEqualToString:@"0"]) {
                    self.title = [NSString stringWithFormat:@"%@  $ %@",d.name,d.price];
                }else{
                    
                    self.title = d.name;
                }
                self.priceLabel.text = [NSString stringWithFormat:@"(长按保存)%ld/%ld", _index, self.dressArray.count];
                
                _dressView.userInteractionEnabled = YES;
                UILongPressGestureRecognizer * singletap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(whenLongClickImage:)];
                UISwipeGestureRecognizer * swipeTapRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImageView:)];
                
                UISwipeGestureRecognizer * swipeTapLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImageView:)];
                swipeTapLeft.direction = UISwipeGestureRecognizerDirectionLeft;
                
                
                [_dressView addGestureRecognizer:swipeTapLeft];
                [_dressView addGestureRecognizer:swipeTapRight];
                [_dressView addGestureRecognizer:singletap];
            }
        }];
    } completionBlock:^{
        [_HUD removeFromSuperview];
        _HUD = nil;
    }];
    
}

- (void)whenLongClickImage:(UILongPressGestureRecognizer *)sender
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self saveImage:self.dressView];
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];

}
- (void)saveImage:(UIImageView *)imageView
{
    UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
   
    if (!error) {
        
        self.alertview = [[UIAlertView alloc] initWithTitle:nil message:@"OK" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_alertview show];
        
    }
}
- (void)performDismiss:(NSTimer*)timer

{
    [_alertview dismissWithClickedButtonIndex:0 animated:NO];
    
}
- (void)changeImageView:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.index++;
        if (_index >= (_dressArray.count+1)) {
            _index = 1;
        }
        __block DressViewController * VC = self;
        [UIView transitionWithView:VC.dressView duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [UIView setAnimationRepeatCount:1];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationBeginsFromCurrentState:YES];
            dressModel * d = _dressArray[_index-1];
            [self.dressView sd_setImageWithURL:[NSURL URLWithString:d.smallImg]];
            if (![d.price isEqualToString:@""] && ![d.price isEqualToString:@"0"]) {
                self.title = [NSString stringWithFormat:@"%@  $ %@",d.name,d.price];
            }else{
            
                self.title = d.name;
            }
self.priceLabel.text = [NSString stringWithFormat:@"%ld/%ld", _index, self.dressArray.count];
        } completion:nil];
        
    }else{
        
        self.index--;
        if (_index <= 0) {
            _index = _dressArray.count;
        }
        
        __block DressViewController * VC = self;
        [UIView transitionWithView:VC.dressView duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            [UIView setAnimationRepeatCount:1];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationBeginsFromCurrentState:YES];
            dressModel * d = _dressArray[_index-1];
            [self.dressView sd_setImageWithURL:[NSURL URLWithString:d.smallImg]];
            if (![d.price isEqualToString:@""] && ![d.price isEqualToString:@"0"]) {
                self.title = [NSString stringWithFormat:@"%@  $ %@",d.name,d.price];
            }else{
                self.title = d.name;
            }
          self.priceLabel.text = [NSString stringWithFormat:@"%ld/%ld", _index, self.dressArray.count];
        } completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
