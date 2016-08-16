//
//  MineVC.m
//  MakeFood
//
//  Created by foscom on 16/8/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MineVC.h"
#import "MineHeadView.h"
#import "LogInVC.h"
@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabv;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *imageSource;
@property(nonatomic,strong)UIView *navView;


@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    _dataSource = [NSMutableArray new];
    _imageSource = [NSMutableArray new];
    
    NSArray *dataArr = @[@[@"全部订单"],@[@"我的钱包",@"待付款",@"待收货",@"待评价"],@[@"我的拼团",@"每日签到",@"我的收藏",@"联系客服"],@[@"淘宝返利"]];
    
    
    
    
    _dataSource  = dataArr.mutableCopy;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tabv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tabv.delegate = self;
    _tabv.dataSource = self;
    [self.view addSubview:_tabv];
    [self makeNavHeadView];
    
}


- (void)makeNavHeadView
{
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    _navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"my_bg.png"]];
    _navView.alpha = 0;
    
    UIButton *btn = [self makeRightSetView];
    [self.view addSubview:_navView];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_navView.mas_right).with.offset(-10);
        make.width.mas_equalTo(@30);
        make.height.mas_equalTo(@30);
        make.bottom.equalTo(_navView.mas_bottom).with.offset(-7);
    }];
}

- (UIButton *)makeRightSetView
{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"ic_my_set.png"] forState:UIControlStateNormal];
    
    
    return btn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)return 200;
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3)return 100;
    return 10;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        MineHeadView *head = [[MineHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        head.loginblock = ^(UIButton *btn){
        
            LogInVC *vc = [[LogInVC alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc
                                           ];
            [self presentViewController:nav animated:YES completion:nil];
            
        };
        head.registblock = ^(UIButton *btn){
            LogInVC *vc = [[LogInVC alloc] init];
            [self presentViewController:vc animated:YES completion:nil];
        };

        
        head.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"my_bg.png"]];
        return head;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource[section] count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
      cell.imageView.image = [UIImage imageNamed:@"ic_my_all_orders.png"];
       cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
       cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _navView.alpha = (scrollView.contentOffset.y/(200-64))*1.2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
