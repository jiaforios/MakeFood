//
//  ViewController.m
//  MakeFood
//
//  Created by foscom on 16/8/9.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NetWorkHelper shareNetManger] postDataWithUrlString:@"http://app.yetang.com/v2/advert/AdvertList" withPara:nil withDataBlock:^(id obj) {
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
