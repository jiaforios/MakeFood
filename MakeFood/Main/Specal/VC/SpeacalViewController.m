//
//  SpeacalViewController.m
//  MakeFood
//
//  Created by foscom on 16/8/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "SpeacalViewController.h"

@interface SpeacalViewController ()

@end

@implementation SpeacalViewController

- (void)viewDidLoad {
    
    self.urlStr = @"";
    self.sliderDataArray =  @[@"上新",@"女装",@"鞋包",@"居家",@"美妆",@"美食",@"母婴童装",@"昨日热卖",@"下期预告"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_mizhe.png"]];
    [super viewDidLoad];

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
