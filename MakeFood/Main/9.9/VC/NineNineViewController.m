//
//  NineNineViewController.m
//  MakeFood
//
//  Created by foscom on 16/8/13.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "NineNineViewController.h"

@interface NineNineViewController ()

@end

@implementation NineNineViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    self.urlStr = @"";
    self.sliderDataArray =  @[@"精选",@"9.9包邮",@"29.9包邮",@"最后疯抢"];
    self.title = @"9.9包邮";
    self.cellKind = CELL_KIND_NINENINE;
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
