//
//  CZDetailViewController.m
//  NO_2
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//
#define KheroSkillpic(heroName, skillNumber) [NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3", heroName, skillNumber]
#import "CZDetailViewController.h"
#import "UIImageView+WebCache.h"
@interface CZDetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.heroPic sd_setImageWithURL:[NSURL URLWithString:KheroPicUrl(_hero_Name)]];
    self.disPlayName.text = [NSString stringWithFormat:@"%@ %@", _CZ_model.ch_name, _CZ_model.ni_name];
    self.authour.text = [NSString stringWithFormat:@"作者:%@", _CZ_model.author];
    self.cost.text = [NSString stringWithFormat:@"战斗力:%@", _CZ_model.combat];
    CGFloat height = [[self class] getTextHeight:_CZ_model.pre_explain];
    CGRect frame = self.chumenmiaoshu.frame;
    _chumenmiaoshu.numberOfLines = 0;
    frame.size.height = height;
    _chumenmiaoshu.frame = frame;
    self.chumenmiaoshu.text = _CZ_model.pre_explain;
    
    CGFloat height1 = [[self class] getTextHeight:_CZ_model.mid_explain];
    CGRect frame1 = self.zhongqimaioshu.frame;
    self.zhongqimaioshu.numberOfLines = 0;
    frame1.size.height = height1;
    _zhongqimaioshu.frame = frame1;
    self.zhongqimaioshu.text = _CZ_model.mid_explain;
    
    CGFloat height2 = [[self class] getTextHeight:_CZ_model.end_explain];
    CGRect frame2 = self.houqimiaoshu.frame;
    self.houqimiaoshu.numberOfLines = 0;
    frame2.size.height = height2;
    _houqimiaoshu.frame = frame2;
    self.houqimiaoshu.text = _CZ_model.end_explain;
    
    CGFloat height3 = [[self class] getTextHeight:_CZ_model.nf_explain];
    CGRect frame3 = self.nifengmiaoshu.frame;
    self.nifengmiaoshu.numberOfLines = 0;
    frame3.size.height = height3;
    _nifengmiaoshu.frame = frame3;
    self.nifengmiaoshu.text = _CZ_model.nf_explain;
    
    
    
    
    NSArray * array = [_CZ_model.skill componentsSeparatedByString:@","];
    [self.skill_1 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[0])]];
    [self.skill_2 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[1])]];
    [self.skill_3 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[2])]];
    [self.skill_4 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[3])]];
    [self.skill_5 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[4])]];
    [self.skill_6 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[5])]];
    [self.skill_7 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[6])]];
    [self.skill_8 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[7])]];
    [self.skill_9 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[8])]];
    [self.skill_10 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[9])]];
    [self.skill_11 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[10])]];
    [self.skill_12 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[11])]];
    [self.skill_13 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[12])]];
    [self.skill_14 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[13])]];
    [self.skill_15 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[14])]];
    [self.skill_16 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[15])]];
    [self.skill_17 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[16])]];
    [self.skill_18 sd_setImageWithURL:[NSURL URLWithString:KheroSkillpic(_hero_Name, array[17])]];
    
    NSArray * array1 = [_CZ_model.pre_cz componentsSeparatedByString:@","];
    switch (array1.count) {
        case 2:{
            [self.chumen_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[0] integerValue])]];
            [self.chumen_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[1] integerValue])]];
            break;
            
        }
        case 3:{
            [self.chumen_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[0] integerValue])]];
            [self.chumen_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[1] integerValue])]];
            [self.chumen_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[2] integerValue])]];
            break;
        }
        case 4:{
            [self.chumen_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[0] integerValue])]];
            [self.chumen_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[1] integerValue])]];
            [self.chumen_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[2] integerValue])]];
            [self.chumen_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[3] integerValue])]];
            break;
        }
        case 5:{
            [self.chumen_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[0] integerValue])]];
            [self.chumen_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[1] integerValue])]];
            [self.chumen_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[2] integerValue])]];
            [self.chumen_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[3] integerValue])]];
            [self.chumen_5 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array1[4] integerValue])]];
            break;
        }
        default:
            break;
    }
    
    NSArray * array2 = [_CZ_model.mid_cz componentsSeparatedByString:@","];
    switch (array2.count) {
        case 3:{
            [self.mid_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[0] integerValue])]];
            [self.mid_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[1] integerValue])]];
            [self.mid_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[2] integerValue])]];
            break;
        }
        case 4:{
            [self.mid_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[0] integerValue])]];
            [self.mid_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[1] integerValue])]];
            [self.mid_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[2] integerValue])]];
             [self.mid_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[3] integerValue])]];
            break;
        }
        case 5:{
            [self.mid_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[0] integerValue])]];
            [self.mid_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[1] integerValue])]];
            [self.mid_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[2] integerValue])]];
            [self.mid_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[3] integerValue])]];
            [self.mid_5 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array2[4] integerValue])]];
            break;
        }
        default:
            break;
    }
    
   
    
     NSArray * array3 = [_CZ_model.end_cz componentsSeparatedByString:@","];
     [self.end_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[0] integerValue])]];
    [self.end_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[1] integerValue])]];
    [self.end_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[2] integerValue])]];
    [self.end_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[3] integerValue])]];
    [self.end_5 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[4] integerValue])]];
    [self.end_6 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array3[5] integerValue])]];
    
    NSArray * array4 = [_CZ_model.nf_cz componentsSeparatedByString:@","];
    switch (array4.count) {
        case 1:{
          [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            break;
        }
        case 2:{
            [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            [self.nifeng_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[1] integerValue])]];
            break;
        }
        case 3:{
            [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            [self.nifeng_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[1] integerValue])]];
            [self.nifeng_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[2] integerValue])]];
            break;
        }
        case 4:{
            [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            [self.nifeng_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[1] integerValue])]];
            [self.nifeng_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[2] integerValue])]];
            [self.nifeng_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[3] integerValue])]];
            break;
        }
        case 5:{
            [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            [self.nifeng_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[1] integerValue])]];
            [self.nifeng_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[2] integerValue])]];
            [self.nifeng_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[3] integerValue])]];
            [self.nifeng_5 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[4] integerValue])]];
            break;
        }
        case 6:{
            [self.nifeng_1 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[0] integerValue])]];
            [self.nifeng_2 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[1] integerValue])]];
            [self.nifeng_3 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[2] integerValue])]];
            [self.nifeng_4 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[3] integerValue])]];
            [self.nifeng_5 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[4] integerValue])]];
            [self.nifeng_6 sd_setImageWithURL:[NSURL URLWithString:KCategoryPic((long)[array4[5] integerValue])]];
            break;
        }
            
        default:
            break;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//计算文本内容大小（ios7.0）
+ (CGFloat)getTextHeight:(NSString *)text
{
    
    CGSize size = CGSizeMake(340, 100000);
    UIFont * font = [UIFont systemFontOfSize:17.0];
    NSDictionary * dic = @{NSFontAttributeName:font};
    CGRect cgrect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:NULL];
    
    return cgrect.size.height;
    
}



@end
