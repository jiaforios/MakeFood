//
//  SpeacalVC.m
//  MakeFood
//
//  Created by foscom on 16/8/11.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "SpeacalVC.h"
#import "QYSmllScroll.h"
@interface SpeacalVC ()

@end

@implementation SpeacalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.edgesForExtendedLayout = UIRectEdgeNone;
        
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_mizhe"]];
    
    
    NSArray *titles = @[@"上新",@"女装",@"鞋包",@"居家",@"美妆",@"美食",@"母婴童装",@"昨日热卖",@"下期预告"];
    QYSmllScroll *sliderBar = [[QYSmllScroll alloc] initWithSmllScroll:titles];
    sliderBar.changeIndexValue = ^(NSInteger index){
    
        NSLog(@"index = %d",index);
    };

    [self.view addSubview:sliderBar];

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
