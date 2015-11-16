//
//  MessageDetailViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/21.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "MessageDetailViewController.h"

@interface MessageDetailViewController ()<UIWebViewDelegate>

@end

@implementation MessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightItem];
//    [self MBProgressShow];
    
     UIWebView * web = [[UIWebView alloc] initWithFrame:self.view.frame];
    //网络请求
    if ([self.model.is_direct isEqualToString:@"True"]) {
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.model.article_url]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [web loadRequest:request];
    }else{
        
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:kMessageDetailURL(self.model.article_url)]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [web loadRequest:request];
        
    }
    //添加网页
    [self.view addSubview:web];
}


////网页加载完毕代理
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    //定义JS字符串(JS代码看不懂没有关系,只要知道怎么用就行了,网上很多代码)
//    NSString *script = [NSString stringWithFormat:
//                        @"var script = document.createElement('script');"
//                        "script.type = 'text/javascript';"
//                        "script.text = \"function ResizeImages() { "
//                        "var myimg;"
//                        "var maxwidth=%f;" //屏幕宽度
//                        "for(i=0;i <document.images.length;i++){"
//                        "myimg = document.images[i];"
//                        "myimg.height = maxwidth / (myimg.width/myimg.height);"
//                        "myimg.width = maxwidth;"
//                        "}"
//                        "}\";"
//                        "document.getElementsByTagName('p')[0].appendChild(script);",self.view.frame.size.width-15];
//    
//    //添加JS
//    [webView stringByEvaluatingJavaScriptFromString:script];
//    
//    //添加调用JS执行的语句
//    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
//}


- (void)createRightItem
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickButtonItem)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)clickButtonItem
{
    [self dismissViewControllerAnimated:NO completion:nil];
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

@end
