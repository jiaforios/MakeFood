//
//  BaseTabViewController.m
//  MakeFood
//
//  Created by foscom on 16/8/11.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "BaseTabViewController.h"
#import "BaseNavViewController.h"
#import "SpeacalVC.h"
@interface BaseTabViewController ()

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   self.viewControllers =  [self creatViewcControllers];
    [self creatTabarItem];
    
}


- (NSArray *)creatViewcControllers
{
    NSArray *Vcarr = @[@"SpeacalVC",@"SpeacalVC",@"SpeacalVC",@"SpeacalVC",@"SpeacalVC"];
    NSMutableArray *arrs = [NSMutableArray new];
    for (int i = 0; i<Vcarr.count; i++) {
        Class obj = NSClassFromString(Vcarr[i]);
         UIViewController *vc  = [[obj alloc]init];
        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vc];
        [arrs addObject:nav];
    }
    return arrs;
}


- (void)creatTabarItem
{
    NSArray *titles = @[@"今日特卖",@"9.9包邮",@"拼团",@"购物车",@"我的"];
    NSArray *images = @[@"btn_nav_home",@"btn_nav_99",@"ic_fight",@"btn_nav_cart",@"btn_nav_mine"];
    for (int i=0; i<titles.count; i++) {
        
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",images[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        vc.tabBarItem.selectedImage =  [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected.png",images[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.title = titles[i];
        
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];

    }

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
