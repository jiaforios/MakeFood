//
//  PinTuanTableVC.m
//  MakeFood
//
//  Created by foscom on 16/8/13.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "PinTuanTableVC.h"

@interface PinTuanTableVC ()

@end

@implementation PinTuanTableVC

- (void)viewDidLoad {
    self.urlStr = @"";
    self.sliderDataArray =  @[@"上新",@"生鲜",@"食品",@"居家",@"美妆",@"母婴",@"服饰",@"下期预告"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_pintuan_logo.png"]];
    self.cellKind = CELL_KIND_PINTUAN;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
