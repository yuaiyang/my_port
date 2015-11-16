//
//  AsynRequestHandle.m
//  UI_24_LastClass
//
//  Created by xdx on 15/9/17.
//  Copyright (c) 2015年 xdx. All rights reserved.
//

#import "AsynRequestHandle.h"

@interface AsynRequestHandle ()

@property (nonatomic, retain) NSMutableData * recieveData;  // 拼接每次请求下来的Data数据

@end

@implementation AsynRequestHandle

- (instancetype)initWithURLString:(NSString *)urlString method:(NSString *)method paramter:(NSString *)paramter
{
    self = [super init];
    if (self) {
        
        if ([method isEqualToString:@"GET"]) {
            
            [self sendGetRequestWithURLString:urlString];
            
        } else if ([method isEqualToString:@"POST"]) {
            
            [self sendPostRequestWithURLString:urlString paramt:paramter];
        }
        
    }
    return self;
}

/**发起GET请求*/
- (void)sendGetRequestWithURLString:(NSString *)urlString
{
    // 创建URL对象
    NSURL * url = [NSURL URLWithString:urlString];
    // 请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    // 建立链接，发送请求
    [NSURLConnection connectionWithRequest:request delegate:self];
}

/**发起POST请求*/
- (void)sendPostRequestWithURLString:(NSString *)urlString paramt:(NSString *)paramter
{
    // 创建URL对象
    NSURL * url = [NSURL URLWithString:urlString];
    // 创建请求对象(NSMutableURLRequest 可变的)
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    // 设置请求方式
    [request setHTTPMethod:@"POST"];
    // 设置请求体
    NSData * data = [paramter dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    // 建立链接并发送请求（异步链接）
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

#pragma mark --- 实现协议（NSURLConnectionDataDelegate, NSURLConnectionDelegate）中的方法
/**已经接收到服务器响应*/
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 在开始响应时开辟空间
    self.recieveData = [NSMutableData data];
}
/**正在接收数据*/
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_recieveData appendData:data];
}
/**数据传输完毕*/
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 当数据下载完毕，将数据通过协议中的方法传出去
//    [代理 执行协议中的方法:_recieveData];
    if ([_delegate respondsToSelector:@selector(asynRequestHandle:didSucceedWithData:)]) {
        [_delegate asynRequestHandle:self didSucceedWithData:_recieveData];
    }
}
/**网络请求失败*/
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if ([_delegate respondsToSelector:@selector(asynRequestHandle:didFailedWithError:)]) {
        [_delegate asynRequestHandle:self didFailedWithError:error];
    }
}

@end









