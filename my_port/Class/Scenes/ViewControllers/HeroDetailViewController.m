//
//  HeroDetailViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "AllModel.h"
#import "UIButton+WebCache.h"
#import "TopForHeroController.h"
#import "MusicTableViewController.h"
#import "CZTableViewController.h"
#import "DressViewController.h"
#import "UserLoginManager.h"
#import "UserLoginManager.h"
#import "user.h"
@interface HeroDetailViewController ()
@property (nonatomic, strong) AllModel * All;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *like_line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hate_line;
- (IBAction)didClickMoreLike:(UIButton *)sender;

- (IBAction)didClickMoreHate:(UIButton *)sender;

@property (nonatomic, strong) NSMutableArray * AheroArray;
@property (nonatomic, strong) NSMutableArray * likeArray;

@property (nonatomic, strong) NSMutableArray * hateArray;

@property (nonatomic, strong) NSDictionary * dict1;
@property (nonatomic, strong) NSDictionary * dict2;
@property (nonatomic, strong) NSDictionary * dict3;
@property (nonatomic, strong) NSDictionary * dict4;
@property (nonatomic, strong) NSDictionary * dict5;
//出装的Button
@property (nonatomic, strong) UIButton * CZButton;
@property (nonatomic, strong) UIButton * CollectBtn;
@property (nonatomic, assign) CGFloat like_height;
@property (nonatomic, assign) CGFloat hate_height;
@property (nonatomic, strong) UIImageView * likePic2;
@property (nonatomic, strong) UILabel * likeLabel2;
@property (nonatomic, strong) UIImageView * hatePic2;
@property (nonatomic, strong) UILabel * hateLabel2;
@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
   self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.line.constant = (self.view.frame.size.width-260)/2.0;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"查看皮肤" style: UIBarButtonItemStylePlain target:self action:@selector(LookToDress)];
  self.navigationItem.rightBarButtonItem = rightItem;
    //铃声BUtton
    self.CollectBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _CollectBtn.frame = CGRectMake(CGRectGetMaxX(self.view.frame)-120, 7, 40, 30);
    //出装Button
    self.CZButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _CZButton.frame = CGRectMake(CGRectGetMaxX(self.view.frame)-160, 7, 40, 30);
    
    NSURL * url = [NSURL URLWithString:KdetailHero(_HeroName)];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    __weak HeroDetailViewController * TempVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            
        
        // 2. 解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        [self.heroPic sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_HeroName)]];
        TempVC.likeArray = dict[@"like"];
        TempVC.hateArray = dict[@"hate"];
        
        //得到技能介绍的model
        NSString * key = [NSString stringWithFormat:@"%@_B", _HeroName];
        self.dict1 = dict[key];
        NSString * key1 = [NSString stringWithFormat:@"%@_Q", _HeroName];
        self.dict2 = dict[key1];
        NSString * key2 = [NSString stringWithFormat:@"%@_W", _HeroName];
        self.dict3 = dict[key2];
        NSString * key3 = [NSString stringWithFormat:@"%@_E", _HeroName];
        self.dict4 = dict[key3];
        NSString * key4 = [NSString stringWithFormat:@"%@_R", _HeroName];
        self.dict5 = dict[key4];
        NSString * s_B = [NSString stringWithFormat:@"%@_B", _HeroName];
        NSString * s_Q = [NSString stringWithFormat:@"%@_Q", _HeroName];
        NSString * s_W = [NSString stringWithFormat:@"%@_W", _HeroName];
        NSString * s_E = [NSString stringWithFormat:@"%@_E", _HeroName];
        NSString * s_R = [NSString stringWithFormat:@"%@_R", _HeroName];
        [self.but_B sd_setBackgroundImageWithURL:[NSURL URLWithString:KheroSkill(s_B)] forState:UIControlStateNormal];
        [self.but_Q sd_setBackgroundImageWithURL:[NSURL URLWithString:KheroSkill(s_Q)] forState:UIControlStateNormal];
        [self.but_W sd_setBackgroundImageWithURL:[NSURL URLWithString:KheroSkill(s_W)] forState:UIControlStateNormal];
        [self.but_E sd_setBackgroundImageWithURL:[NSURL URLWithString:KheroSkill(s_E)] forState:UIControlStateNormal];
        [self.but_R sd_setBackgroundImageWithURL:[NSURL URLWithString:KheroSkill(s_R)] forState:UIControlStateNormal];
        
        TempVC.AheroArray = [NSMutableArray array];
        TempVC.All = [AllModel new];
        [TempVC.All setValuesForKeysWithDictionary:dict];
        
        self.disPlayName.text = _All.displayName;
        self.tigsLabel.text = _All.tags;
        NSString * str1 =[_All.price substringToIndex:4];
        NSString * str2 =[_All.price substringFromIndex:5];
       self.priceLabel.text = [NSString stringWithFormat:@"金%@卷%@",str1, str2];
        self.introduce.text = [NSString stringWithFormat:@"攻%@  防%@  法%@  难度%@",_All.ratingAttack, _All.ratingDefense, _All.ratingMagic, _All.ratingDifficulty];
        [self.likeHero sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_likeArray.firstObject[@"partner"])]];
        self.like_des.text = _likeArray.firstObject[@"des"];
          self.like_height = [[self class] getTextHeightDes:_likeArray.firstObject[@"des"] width:self.view.frame.size.width - 65];
           
            if (self.like_height > 43) {
                self.like_line.constant = self.like_height + 15;
            }else{
                self.like_line.constant = 60;
            }
       
        [self.heatHero sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hateArray.firstObject[@"partner"])]];
        self.hate_des.text = _hateArray.firstObject[@"des"];
            
        self.hate_height = [[self class] getTextHeightDes:_hateArray.firstObject[@"des"] width:self.view.frame.size.width - 65];
            if (self.hate_height > 43) {
                self.hate_line.constant = self.hate_height + 15;
            }else{
            
                self.hate_line.constant = 60;
            }
            
        self.useLabel.text = _All.tips;
        self.kezhiLabel.text = _All.opponentTips;
        self.backLabel.text = _All.ID_description;
            
            self.skill_des.layer.cornerRadius = 4;
            self.skill_des.layer.masksToBounds = YES;
            
            self.likeView.layer.cornerRadius = 4;
            self.likeView.layer.masksToBounds = YES;
            
            self.heatView.layer.cornerRadius = 4;
            self.heatView.layer.masksToBounds = YES;
            
            
            self.useLabel.layer.cornerRadius = 4;
            self.useLabel.layer.masksToBounds = YES;
            
            self.kezhiLabel.layer.cornerRadius = 4;
            self.kezhiLabel.layer.masksToBounds = YES;
            
            self.backLabel.layer.cornerRadius  = 4;
            self.backLabel.layer.masksToBounds = YES;
        
        [self skill_B:nil];
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
 
    
}
//查看英雄皮肤
-(void)LookToDress
{
    UIStoryboard * board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DressViewController * DVC = [board instantiateViewControllerWithIdentifier:@"dress_ID"];
    
    DVC.HeroName = _HeroName;
    
    [self.navigationController pushViewController:DVC animated:YES];
    
    
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_CollectBtn setTitle:@"铃声" forState:UIControlStateNormal];
    _CollectBtn.titleLabel.font = [UIFont fontWithName:nil size:17];
    [_CollectBtn addTarget:self action:@selector(didClickCollectBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_CollectBtn];
    
    [_CZButton setTitle:@"出装" forState:UIControlStateNormal];
    _CZButton.titleLabel.font = [UIFont fontWithName:nil size:17];
    [_CZButton addTarget:self action:@selector(didClickCzBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_CZButton];
  
    
}
//计算文本内容大小（ios7.0）
+ (CGFloat)getTextHeightDes:(NSString *)text width:(CGFloat )width
{
    
    CGSize size = CGSizeMake(width, 100000);
    UIFont * font = [UIFont systemFontOfSize:12.0];
    NSDictionary * dic = @{NSFontAttributeName:font};
    CGRect cgrect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:NULL];
    
    return cgrect.size.height;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self.CollectBtn removeFromSuperview];
    [self.CZButton removeFromSuperview];
}
//铃声
- (void)didClickCollectBtn
{
    MusicTableViewController * MVC = [[MusicTableViewController alloc] init];
    
    MVC.heroName = _HeroName;
    
    [self.navigationController pushViewController:MVC animated:YES];
}
//出装
- (void)didClickCzBtn
{
    CZTableViewController * CVC = [[CZTableViewController alloc] init];
    CVC.heroName = _HeroName;
    [self.navigationController pushViewController:CVC animated:YES];
    
    
}
- (IBAction)didClickSugesst:(UIButton *)sender {
    TopForHeroController * tVC = [[TopForHeroController alloc] init];
    tVC.HeroName = _HeroName;
    tVC.number = 2;
    [self.navigationController pushViewController:tVC animated:YES];
    
    
}


- (IBAction)skill_B:(UIButton *)sender {
    
  
    
    NSString * tempString = [NSString stringWithFormat:@"%@(被动)\n描述:%@", _dict1[@"name"], _dict1[@"description"]];
    
    self.skill_des.text = tempString;
    
}

- (IBAction)skill_Q:(UIButton *)sender {
     NSString * tempString = [NSString stringWithFormat:@"%@(Q)\n消耗:%@\n冷却:%@\n范围:%@\n效果:%@\n描述:%@", _dict2[@"name"],_dict2[@"cost"], _dict2[@"cooldown"],_dict2[@"range"],_dict2[@"effect"], _dict2[@"description"]];
    
    self.skill_des.text = tempString;
}

- (IBAction)skill_W:(UIButton *)sender {
     NSString * tempString = [NSString stringWithFormat:@"%@(W)\n消耗:%@\n冷却:%@\n范围:%@\n效果:%@\n描述:%@", _dict3[@"name"],_dict3[@"cost"], _dict3[@"cooldown"],_dict3[@"range"],_dict3[@"effect"], _dict3[@"description"]];
    
    self.skill_des.text = tempString;
}

- (IBAction)skill_E:(UIButton *)sender {
     NSString * tempString = [NSString stringWithFormat:@"%@(E)\n消耗:%@\n冷却:%@\n范围:%@\n效果:%@\n描述:%@", _dict4[@"name"],_dict4[@"cost"], _dict4[@"cooldown"],_dict4[@"range"],_dict4[@"effect"], _dict4[@"description"]];
    self.skill_des.text = tempString;
}

- (IBAction)skill_R:(UIButton *)sender {
 NSString * tempString = [NSString stringWithFormat:@"%@(R)\n消耗:%@\n冷却:%@\n范围:%@\n效果:%@\n描述:%@", _dict5[@"name"],_dict5[@"cost"], _dict5[@"cooldown"],_dict5[@"range"],_dict5[@"effect"], _dict5[@"description"]];
    
    self.skill_des.text = tempString;
}


- (IBAction)didClickCollection:(UIButton *)sender {
  
 
        user * tempUser = [[UserLoginManager SharedInstance] getAuserByUserName:@"Root"];
        if (!tempUser.heroNameArray) {
             [[UserLoginManager SharedInstance] regisAUser:@"Root"];
            tempUser = [[UserLoginManager SharedInstance] getAuserByUserName:@"Root"];
        }
        if (tempUser.heroNameArray.count > 0) {
            NSMutableArray * array = tempUser.heroNameArray;
            for (NSString * str in array) {
                if ([str isEqualToString:_HeroName]) {
                    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"你已经收藏过了" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    [alertView show];
                    [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:1.f];
                    return;
                }
            }
            
            
            [[UserLoginManager SharedInstance] shoucang:_HeroName];
           UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"OK" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            [alertView show];
            [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:1.3];
        }else{
            [[UserLoginManager SharedInstance] regisAUser:@"Root"];
            [[UserLoginManager SharedInstance] shoucang:_HeroName];
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"OK" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            [alertView show];
            [self performSelector:@selector(dismissAlerView:) withObject:alertView afterDelay:1.3];
        }
    
    
    
}
- (void)dismissAlerView:(UIAlertView *)alertView {
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}
- (IBAction)didClickMoreLike:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"点击查看更多拍档👇"]) {
        [sender setTitle:@"点击隐藏" forState:UIControlStateNormal];
        if (self.like_height > 43) {
            
            self.likeLabel2 = [[UILabel alloc] init];
            _likeLabel2.numberOfLines = 0;
            _likeLabel2.font = [UIFont fontWithName:nil size:12];
   CGFloat like_2 = [[self class] getTextHeightDes:_likeArray.lastObject[@"des"] width:self.view.frame.size.width - 65];
            
            if (like_2 > 43) {
                
              self.like_line.constant = self.like_height + like_2 + 15;
                
                _likeLabel2.text = _likeArray.lastObject[@"des"];
                _likeLabel2.frame = CGRectMake(45, _like_height+7, self.view.frame.size.width - 65, like_2);
                
                self.likePic2 = [[UIImageView alloc] init];
                _likePic2.frame = CGRectMake(2, _like_height+10, 40, 40);
                [_likePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_likeArray.lastObject[@"partner"])]];
                [_likeView addSubview:_likeLabel2];
                [_likeView addSubview:_likePic2];
                
            }else{
            self.like_line.constant = self.like_height + 55;
            
                _likeLabel2.text = _likeArray.lastObject[@"des"];
                _likeLabel2.frame = CGRectMake(45, _like_height+7, self.view.frame.size.width - 65, like_2);
                
                self.likePic2 = [[UIImageView alloc] init];
                _likePic2.frame = CGRectMake(2, _like_height+10, 40, 40);
                [_likePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_likeArray.lastObject[@"partner"])]];
                [_likeView addSubview:_likeLabel2];
                [_likeView addSubview:_likePic2];
            }
           
        }else{
        
            self.likeLabel2 = [[UILabel alloc] init];
            _likeLabel2.numberOfLines = 0;
            _likeLabel2.font = [UIFont fontWithName:nil size:12];
            CGFloat like_2 = [[self class] getTextHeightDes:_likeArray.lastObject[@"des"] width:self.view.frame.size.width - 65];
            
            if (like_2 > 43) {
                
                self.like_line.constant = 60 + like_2;
                
                _likeLabel2.text = _likeArray.lastObject[@"des"];
                _likeLabel2.frame = CGRectMake(45, 50, self.view.frame.size.width - 65, like_2);
                
                self.likePic2 = [[UIImageView alloc] init];
                _likePic2.frame = CGRectMake(2, 53, 40, 40);
                [_likePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_likeArray.lastObject[@"partner"])]];
                [_likeView addSubview:_likeLabel2];
                [_likeView addSubview:_likePic2];
                
            }else{
                self.like_line.constant = 105;
                
                _likeLabel2.text = _likeArray.lastObject[@"des"];
                _likeLabel2.frame = CGRectMake(45, 50, self.view.frame.size.width - 65, like_2);
                
                self.likePic2 = [[UIImageView alloc] init];
                _likePic2.frame = CGRectMake(2, 53, 40, 40);
                [_likePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_likeArray.lastObject[@"partner"])]];
                [_likeView addSubview:_likeLabel2];
                [_likeView addSubview:_likePic2];
            }
        
        }
    }else{
        [sender setTitle:@"点击查看更多拍档👇" forState:UIControlStateNormal];
        [_likeLabel2 removeFromSuperview];
        [_likePic2 removeFromSuperview];
    
        if (self.like_height > 43) {
            self.like_line.constant = self.like_height + 15;
        }else{
            self.like_line.constant = 60;
        }
    }
}

- (IBAction)didClickMoreHate:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"点击查看更多克制👇"]) {
        [sender setTitle:@"点击隐藏" forState:UIControlStateNormal];
        if (self.hate_height > 43) {
            
            self.hateLabel2 = [[UILabel alloc] init];
            _hateLabel2.numberOfLines = 0;
            _hateLabel2.font = [UIFont fontWithName:nil size:12];
            CGFloat like_2 = [[self class] getTextHeightDes:_hateArray.lastObject[@"des"] width:self.view.frame.size.width - 65];
            
            if (like_2 > 43) {
                
                self.hate_line.constant = self.hate_height + like_2 + 15;
                
                _hateLabel2.text = _hateArray.lastObject[@"des"];
                _hateLabel2.frame = CGRectMake(45, _hate_height+7, self.view.frame.size.width - 65, like_2);
                
                self.hatePic2 = [[UIImageView alloc] init];
                _hatePic2.frame = CGRectMake(2, _hate_height+10, 40, 40);
                [_hatePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hateArray.lastObject[@"partner"])]];
                [_heatView addSubview:_hateLabel2];
                [_heatView addSubview:_hatePic2];
                
            }else{
                self.hate_line.constant = self.hate_height + 55;
                
                _hateLabel2.text = _hateArray.lastObject[@"des"];
                _hateLabel2.frame = CGRectMake(45, _hate_height+7, self.view.frame.size.width - 65, like_2);
                
                self.hatePic2 = [[UIImageView alloc] init];
                _hatePic2.frame = CGRectMake(2, _hate_height+10, 40, 40);
                [_hatePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hateArray.lastObject[@"partner"])]];
                [_heatView addSubview:_hateLabel2];
                [_heatView addSubview:_hatePic2];
            }
            
        }else{
            
            self.hateLabel2 = [[UILabel alloc] init];
            _hateLabel2.numberOfLines = 0;
            _hateLabel2.font = [UIFont fontWithName:nil size:12];
            CGFloat like_2 = [[self class] getTextHeightDes:_hateArray.lastObject[@"des"] width:self.view.frame.size.width - 65];
            
            if (like_2 > 43) {
                
                self.hate_line.constant = 60 + like_2;
                
                _hateLabel2.text = _hateArray.lastObject[@"des"];
                _hateLabel2.frame = CGRectMake(45, 50, self.view.frame.size.width - 65, like_2);
                
                self.hatePic2 = [[UIImageView alloc] init];
                _hatePic2.frame = CGRectMake(2, 53, 40, 40);
                [_hatePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hateArray.lastObject[@"partner"])]];
                [_heatView addSubview:_hateLabel2];
                [_heatView addSubview:_hatePic2];
                
            }else{
                self.hate_line.constant = 105;
                
                _hateLabel2.text = _hateArray.lastObject[@"des"];
                _hateLabel2.frame = CGRectMake(45, 50, self.view.frame.size.width - 65, like_2);
                
                self.hatePic2 = [[UIImageView alloc] init];
                _hatePic2.frame = CGRectMake(2, 53, 40, 40);
                [_hatePic2 sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hateArray.lastObject[@"partner"])]];
                [_heatView addSubview:_hateLabel2];
                [_heatView addSubview:_hatePic2];
            }
            
        }
    }else{
        [sender setTitle:@"点击查看更多克制👇" forState:UIControlStateNormal];
        [_hateLabel2 removeFromSuperview];
        [_hatePic2 removeFromSuperview];
        
        if (self.hate_height > 43) {
            self.hate_line.constant = self.hate_height + 15;
        }else{
            self.hate_line.constant = 60;
        }
    }
}
@end
