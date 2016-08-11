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
    
}


- (NSArray *)creatViewcControllers
{
    NSArray *Vcarr = @[@"SpeacalVC",@"",@"",@"",@""];
    NSMutableArray *arrs = [NSMutableArray new];
    for (int i = 0; i<Vcarr.count; i++) {
        
        Class isobj = NSClassFromString(Vcarr[i]);
        UIViewController *vc = (UIViewController*)[[isobj class] init];
        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vc];
        
        [arrs addObject:nav];
    }
    return Vcarr;
}


- (void)creatTabarItem
{
    NSArray *titles = @[@"",@"",@"",@"",@""];
    NSArray *images = @[@"btn_nav_home",@"btn_nav_99",@"",@"btn_nav_cart",@"btn_nav_mine"];
    for (int i=0; i<titles.count; i++) {
        
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",titles[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        vc.tabBarItem.selectedImage =  [[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",titles[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
