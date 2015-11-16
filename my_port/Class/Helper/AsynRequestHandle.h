//
//  AsynRequestHandle.h
//  UI_24_LastClass
//
//  Created by xdx on 15/9/17.
//  Copyright (c) 2015年 xdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AsynRequestHandle;

// 协议
@protocol AsynRequestHandleDelegate <NSObject>

- (void)asynRequestHandle:(AsynRequestHandle *)requestHandle didSucceedWithData:(NSData *)data;

- (void)asynRequestHandle:(AsynRequestHandle *)requestHandle didFailedWithError:(NSError *)error;

@end

@interface AsynRequestHandle : NSObject<NSURLConnectionDataDelegate, NSURLConnectionDelegate>

- (instancetype)initWithURLString:(NSString *)urlString method:(NSString *)method paramter:(NSString *)paramter;

// 声明代理属性
@property (nonatomic, assign) id<AsynRequestHandleDelegate> delegate;

@end
