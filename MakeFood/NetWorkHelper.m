//
//  NetWorkHelper.m
//  MakeFood
//
//  Created by foscom on 16/8/9.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "NetWorkHelper.h"
#import "AFNetworking.h"
@implementation NetWorkHelper
{
    AFHTTPSessionManager *manger;
}
+ (instancetype)shareNetManger
{
    static NetWorkHelper *netManger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        netManger = [[NetWorkHelper alloc] init];
    });
    return netManger;
}
- (instancetype)init
{
    if (self = [super init]) {
         manger = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)getDataWithUrlString:(NSString *)urlstr
                    withPara:(id)para
               withDataBlock:(DataBlock)datablock
{
    
    [manger GET:urlstr parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}

- (void)postDataWithUrlString:(NSString *)urlStr
                     withPara:(id)para
                withDataBlock:(DataBlock)datablock
{
    [manger POST:urlStr parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}

@end
