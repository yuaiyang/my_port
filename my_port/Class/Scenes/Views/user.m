//
//  user.m
//  NO_2
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "user.h"
@implementation user
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.heroNameArray forKey:@"array"];
    
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.heroNameArray = [aDecoder decodeObjectForKey:@"array"];
    }
    return self;
}
@end
