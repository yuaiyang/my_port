//
//  TopForHeroController.m
//  NO_2
//
//  Created by lanou3g on 15/10/6.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "TopForHeroController.h"

@interface TopForHeroController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView * web;
@end

@implementation TopForHeroController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
  
    
    
      self.web = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    
    // 添加下拉刷新控件
    self.web.scrollView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        if (self.web.scrollView.header.isRefreshing) {
          [self.web.scrollView.header endRefreshing];  
        }
        
    }];
    //网络请求
    if (self.number == 2) {
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:Kintroduce(_HeroName)]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [_web loadRequest:request];
    }else{
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:KKeyWords]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [_web loadRequest:request];
        
        
    }
    
    
    //获取data格式数据
   // NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //根据data转换为json串
   // NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //KVC要显示的内容
   // NSString * string = dataDic[@"data"][@"body"];
    
    //让网页适配自己的屏幕(但是会有空白地方,所以下面加了一段JS来控制显示大小,JS不会没有关系,去网上一查一大堆)
    _web.scalesPageToFit = YES;
    
    //[注意]加载HTML格式内容 用下面这个方法, 这个方法可以把HTML格式的内容转换
    //[web loadHTMLString:string baseURL:nil];
    
    //设置代理,主要就是用来执行网页加载完成代理方法(来控制网页大小)
    _web.delegate = self;
    
    //添加网页
    [self.view addSubview:_web];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//网页加载完毕代理
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //定义JS字符串(JS代码看不懂没有关系,只要知道怎么用就行了,网上很多代码)
    NSString *script = [NSString stringWithFormat:
                        @"var script = document.createElement('script');"
                        "script.type = 'text/javascript';"
                        "script.text = \"function ResizeImages() { "
                        "var myimg;"
                        "var maxwidth=%f;" //屏幕宽度
                        "for(i=0;i <document.images.length;i++){"
                        "myimg = document.images[i];"
                        "myimg.height = maxwidth / (myimg.width/myimg.height);"
                        "myimg.width = maxwidth;"
                        "}"
                        "}\";"
                        "document.getElementsByTagName('p')[0].appendChild(script);",self.view.frame.size.width];
    
    //添加JS
    [webView stringByEvaluatingJavaScriptFromString:script];
    
    //添加调用JS执行的语句
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
