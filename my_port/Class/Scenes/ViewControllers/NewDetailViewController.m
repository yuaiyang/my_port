//
//  NewDetailViewController.m
//  my_port
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "NewDetailViewController.h"

@interface NewDetailViewController ()<UIWebViewDelegate>

@end

@implementation NewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * web = [[UIWebView alloc] initWithFrame:self.view.frame];
    //网络请求
    
    if ([self.model.is_direct isEqualToString:@"True"]) {
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.model.article_url]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [web loadRequest:request];
    }else{
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:kNewDetailURL(self.model.article_url)]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [web loadRequest:request];
//        NSString *dataString =  [NSString stringWithContentsOfURL:[NSURL URLWithString:kNewDetailURL(self.model.article_url)] encoding:NSUTF8StringEncoding error:nil];
//        
//        NSRange rang1=[dataString rangeOfString:@"<div class=\"article_box\">"];
//        NSMutableString *imageStr2=[[NSMutableString alloc]initWithString:[dataString substringFromIndex:rang1.location]];
//        
//        NSRange rang2=[imageStr2 rangeOfString:@"<script src=\"http://pub.idqqimg.com/qqmobile/qqapi.js?_bid=152\"></script>"];
//        NSMutableString *imageStr3=[[NSMutableString alloc]initWithString:[imageStr2 substringToIndex:rang2.location]];
//        
//        [web loadHTMLString:imageStr3 baseURL:nil];
//        
//        //设置代理,主要就是用来执行网页加载完成代理方法(来控制网页大小)
//        web.delegate = self;
    }
    //添加网页
    [self.view addSubview:web];
}

//网页加载完毕代理
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
