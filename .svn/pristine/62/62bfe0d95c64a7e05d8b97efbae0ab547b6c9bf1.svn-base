//
//  HostViewController.m
//  ICViewPager
//
//  Created by Ilter Cengiz on 28/08/2013.
//  Copyright (c) 2013 Ilter Cengiz. All rights reserved.
//

#import "HostViewController.h"
#import "MessageTableViewController.h"


@interface HostViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property (nonatomic, strong)NSMutableArray * IDarray;//存放列表ID的数组


@property (nonatomic , strong) NSArray * KeyArray;//存放标题数据key值的数组


@end

@implementation HostViewController

- (void)viewDidLoad {
     self.title = @"资讯";
    
    self.dataSource = self;
    self.delegate = self;
    // Keeps tab bar below navigation bar on iOS 7.0+
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    NSString * path = [[NSBundle mainBundle] pathForResource:@"MessageList" ofType:@"plist"];
    NSMutableDictionary * dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    self.KeyArray = [dictionary allKeys];
    for (NSString * str in dictionary) {
        [self.IDarray addObject:dictionary[str]];
    }
    
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return _KeyArray.count;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:18.0];
    label.text = [NSString stringWithFormat:@"%@",_KeyArray[index]];
    //添加约束，使按钮在屏幕水平方向的中央
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor yellowColor];
    [label sizeToFit];
    label.userInteractionEnabled = YES;
    
    
    return label;
}


- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    MessageTableViewController * Mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"messageTVC"];
//    NSLog(@"%@",_KeyArray[index]);
    Mvc.a_id = [_IDarray[index] integerValue];
    
   
    return Mvc;
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        default:
            break;
    }
    
    return value;
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}

- (NSMutableArray *)IDarray
{
    if (!_IDarray) {
        _IDarray = [NSMutableArray array];
    }
    return _IDarray;
}

@end
