//
//  ShopCarVC.m
//  MakeFood
//
//  Created by foscom on 16/8/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ShopCarVC.h"
@interface ShopCarVC ()

@end

@implementation ShopCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"购物车";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor blackColor]};
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