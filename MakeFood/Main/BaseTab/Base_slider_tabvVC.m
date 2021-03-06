//
//  Base_slider_tabvVC.m
//  MakeFood
//
//  Created by foscom on 16/8/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "Base_slider_tabvVC.h"
#import "QYSmllScroll.h"
#import "SpecalHeadView.h"
#import "Just_imgeCell.h"
#import "Image_labelHeadView.h"
#import "NineNineCell.h"
#import "PinTuanCell.h"
#define Base_tabv_tag 1000
@interface Base_slider_tabvVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UITableView *tabview;
@property(nonatomic,strong)QYSmllScroll *sliderBar;
@end

@implementation Base_slider_tabvVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.automaticallyAdjustsScrollViewInsets = NO;
    [self makeSliderBar];
    [self makeScrollView];

}

- (void)makeSliderBar
{
    NSArray *titles = _sliderDataArray;
    __block Base_slider_tabvVC *blockSelf = self;
    _sliderBar = [[QYSmllScroll alloc] initWithSmllScroll:titles];
    _sliderBar.changeIndexValue = ^(NSInteger index){
        [UIView animateWithDuration:0.25 animations:^{
          [blockSelf.scrollview setContentOffset:CGPointMake(index*SCREEN_WIDTH, 0)];
        }];
    };
    [self.view addSubview:_sliderBar];
}


- (void)makeScrollView
{
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, viewStatPlace, SCREEN_WIDTH, SCREEN_HEIGH-viewStatPlace -49)];
    for (int i = 0; i<_sliderDataArray.count; i++) {

        UITableView *tabv =[self makeTabviewWithPlace:Base_tabv_tag + i withFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGH-viewStatPlace)];
        [_scrollview addSubview:tabv];
    }
    _scrollview.pagingEnabled = YES;
    _scrollview.delegate = self;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH*[_sliderDataArray count], 0);
    [self.view addSubview:_scrollview];
}

- (UITableView *)makeTabviewWithPlace:(NSInteger)place withFrame:(CGRect)frame
{
    UITableView *tabview = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tabview.dataSource = self;
    tabview.delegate = self;
    tabview.tag = place;
    if (_cellKind == CELL_KIND_SPECAL) {
        [tabview registerNib:[UINib nibWithNibName:@"Just_imgeCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        switch (place - Base_tabv_tag) {
            case 0:[self makeSpecalHeadViewWith:tabview];break;
            case 2:
            case 4: [self makeImage_labelHeadViewWith:tabview];break;
            default:
                break;
        }
    }
    if (_cellKind == CELL_KIND_NINENINE) {
        [tabview registerNib:[UINib nibWithNibName:@"NineNineCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }

    if (_cellKind == CELL_KIND_PINTUAN) {
        [tabview registerNib:[UINib nibWithNibName:@"PinTuanCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    }

    return tabview;
}
- (void)makeSpecalHeadViewWith:(UITableView *)tabv;
{
    SpecalHeadView *specalView = [[SpecalHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 390)];
    tabv.tableHeaderView = specalView;
}
-(void)makeImage_labelHeadViewWith:(UITableView *)tabv
{
    Image_labelHeadView *ilView = [[Image_labelHeadView alloc] initWithFrame:CGRectMake(0, viewStatPlace, SCREEN_WIDTH, 100)];
    tabv.tableHeaderView = ilView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_cellKind == CELL_KIND_NINENINE) return 150.f;
    if (_cellKind == CELL_KIND_SPECAL)   return 250.f;
    if (_cellKind == CELL_KIND_PINTUAN)  return 240;
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        return;
    }
    _sliderBar.index = scrollView.contentOffset.x/SCREEN_WIDTH;
    
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
