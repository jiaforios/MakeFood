//
//  SpecalHeadView.m
//  MakeFood
//
//  Created by foscom on 16/8/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "SpecalHeadView.h"
#import "WYScrollView.h"
#define FiveView_subView_count 5
#define Base_five_btn_Tag 1000
#define Base_four_btn_Tag 2000
#define Loop_high 150
#define Five_high 80
#define Four_high 140

@interface SpecalHeadView ()
@property(nonatomic,strong)WYScrollView *loopView;
@property(nonatomic,strong)UIView *fiveViews;
@property(nonatomic,strong)UIView *fourViews;

@end
@implementation SpecalHeadView

+ (instancetype)shareViewMangeWithFrame:(CGRect)frame
{
    
    static SpecalHeadView *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[self alloc] initWithFrame:frame];
    });
    return manger;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = BaseColor;
        [self addSubview:self.loopView];
        [self addSubview:self.fiveViews];
        [self addSubview:self.fourViews];
        [self masonryLayout];
    }
    return self;
}


- (void)masonryLayout
{
    [self.loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(self);
        make.height.equalTo(@(Loop_high));
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        
    }];
    
    [self.fiveViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(@(Five_high));
        make.top.equalTo(self.loopView.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        
    }];
    
    [self.fourViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.top.equalTo(self.fiveViews.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.height.equalTo(@(Four_high));
    }];
    
}

- (WYScrollView *)loopView
{
    if (_loopView == nil) {
        
        
        NSArray *arr2 = @[@"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", @"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", @"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
        _loopView = [WYScrollView scrollViewWithImageArray:arr2 describeArray:nil];
        _loopView.pagePosition = PositionBottomRight;
        _loopView.imageClickBlock = ^(NSInteger index){
        };
        
    }
    
    
    return _loopView;
}

- (UIView *)fiveViews
{
    if (_fiveViews == nil) {
        
        _fiveViews = [[UIView alloc] initWithFrame:CGRectZero];
        _fiveViews.backgroundColor = [UIColor blueColor];
        
        for (int i = 0; i<FiveView_subView_count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*(SCREEN_WIDTH/5), 0, (SCREEN_WIDTH/5), Five_high);
            btn.backgroundColor = Color(arc4random()%256, arc4random()%256, arc4random()%256);
            btn.tag = Base_five_btn_Tag+i;
            [btn addTarget:self action:@selector(fiveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_fiveViews addSubview:btn];
        }
        
    }
    return _fiveViews;
}

- (UIView *)fourViews
{
    if (_fourViews == nil) {
        
        _fourViews = [[UIView alloc] initWithFrame:CGRectZero];
        _fourViews.backgroundColor =[UIColor redColor];
        UIButton *leftView = [UIButton buttonWithType:UIButtonTypeCustom];
        leftView.backgroundColor = [UIColor redColor];
        leftView.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, Four_high);
        [_fourViews addSubview:leftView];
        
        UIButton *up_r_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        up_r_btn.backgroundColor = [UIColor yellowColor];
        up_r_btn.frame = CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, Four_high);
        [_fourViews addSubview:up_r_btn];
        
        UIButton *down_l_btn =[UIButton buttonWithType:UIButtonTypeCustom];
        down_l_btn.backgroundColor = [UIColor cyanColor];
        down_l_btn.frame = CGRectMake(SCREEN_WIDTH/2, Four_high*0.5, SCREEN_WIDTH/2, Four_high*0.5);
        [_fourViews addSubview:down_l_btn];
        
        UIButton *down_r_btn =[UIButton buttonWithType:UIButtonTypeCustom];
        down_r_btn.backgroundColor = [UIColor blueColor];
        down_r_btn.frame = CGRectMake(SCREEN_WIDTH/2 +SCREEN_WIDTH/4, Four_high*0.5, SCREEN_WIDTH/2, Four_high*0.5);
        [_fourViews addSubview:down_r_btn];
        
        leftView.tag = Base_four_btn_Tag;
        up_r_btn.tag = Base_four_btn_Tag+1;
        down_l_btn.tag = Base_four_btn_Tag+2;
        down_r_btn.tag = Base_four_btn_Tag+3;

        [leftView addTarget:self action:@selector(fourBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _fourViews;
}

- (void)fourBtnAction:(UIButton *)sender
{
    NSLog(@"btn.tag = %ld",(long)sender.tag);
}

- (void)fiveBtnAction:(UIButton *)sender
{
    NSLog(@"btn.tag = %ld",(long)sender.tag);
}

@end
