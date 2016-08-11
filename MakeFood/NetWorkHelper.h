//
//  NetWorkHelper.h
//  MakeFood
//
//  Created by foscom on 16/8/9.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataBlock)(id obj);
@interface NetWorkHelper : NSObject
+ (instancetype)shareNetManger;


- (void)getDataWithUrlString:(NSString *)urlstr
                    withPara:(id)para
               withDataBlock:(DataBlock)datablock;


- (void)postDataWithUrlString:(NSString *)urlStr withPara:(id)para withDataBlock:(DataBlock)datablock;

@end
