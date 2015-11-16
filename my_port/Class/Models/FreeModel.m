//
//  FreeModel.m
//  jiegeHezi
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 zhangjie. All rights reserved.
//

#import "FreeModel.h"

@implementation FreeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"tags"]) {
        if ([value isEqualToString:@"marksman"]) {
            self.kind = @"射手";
        }else if ([value isEqualToString:@"assassin"]){
        
        self.kind = @"刺客";
        
        }else if ([value isEqualToString:@"fighter"]){
        
            self.kind = @"战士";
        
        }else if([value isEqualToString:@"mage"]){
        
        self.kind = @"法师";
        
        }else if ([value isEqualToString:@"tank"]){
        
           self.kind = @"坦克";
        }else if ([value isEqualToString:@"support"]){
            
            self.kind = @"辅助";
        }
    
            
    }

}
@end
