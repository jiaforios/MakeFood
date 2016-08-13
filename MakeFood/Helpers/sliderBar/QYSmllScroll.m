//
//  QYSmllScroll.m//
//  Created by qingyun on 16/1/26.
//  Copyright (c) 2016年 qingyun. All rights reserved.
//

#define scrollWidth SCREEN_WIDTH
#define buttonWidth scrollWidth / 5
#import "QYSmllScroll.h"
@interface QYSmllScroll()
@property (nonatomic,strong)NSMutableArray *buttonArr;
@property (nonatomic, strong) UIView *slideView;
@property (nonatomic,strong)NSArray *stringLengthArr;
@property (nonatomic,strong)NSArray *arrsss;
@property (nonatomic,assign)CGFloat totalvalue;

@end
@implementation QYSmllScroll

-(instancetype)initWithSmllScroll:(NSArray *)arrays{
    if (self = [super init])
    {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.frame = CGRectMake(0, 63, scrollWidth, barHeight);
        _arrsss = arrays;
        _stringLengthArr =  [self getButtonLengthFrom:arrays];
        [_stringLengthArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            _totalvalue += [obj floatValue];
        }];
        if (_totalvalue < SCREEN_WIDTH) {
            self.contentSize = CGSizeMake(SCREEN_WIDTH, barHeight);
        }else
        {
            self.contentSize = CGSizeMake(_totalvalue, barHeight);
        }
        self.contentSize = CGSizeMake(_totalvalue, barHeight);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7].CGColor;
        [self makeSliderBarView];
    }
    
    return self;
}


-(void)makeSliderBarView
{
    [self createSlideView];
    NSMutableArray *arr = [NSMutableArray array];
    CGFloat beforeBtnx = 0;
    for (int i = 0; i < _arrsss.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat widths = [_stringLengthArr[i] floatValue];
        if (_totalvalue < SCREEN_WIDTH ) {
            widths = SCREEN_WIDTH/_arrsss.count;
        }
        btn.frame = CGRectMake(beforeBtnx, 0, widths, barHeight);
        [btn setTitle:_arrsss[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        btn.tag = i +100;
        [arr addObject:btn];
        beforeBtnx = CGRectGetMaxX(btn.frame);
        
    }
    self.buttonArr = arr;
    self.index = 0;

}

- (NSArray *)getButtonLengthFrom:(NSArray *)arr
{
    // 根据获取到的title数组 计算每个button 的长度
    NSMutableArray *marr = [NSMutableArray new];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *str = (NSString *)obj;
        CGSize realSize = [str boundingRectWithSize:CGSizeMake(1000, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
        CGFloat strlength = realSize.width;
        [marr addObject:@(strlength + 20)];
        
    }];
    
    return marr;
}
//创建滑动的视图
-(void)createSlideView{
    CGFloat initValuex = [_stringLengthArr[0] floatValue];
    _slideView = [[UIView alloc]initWithFrame:CGRectMake(0, barHeight -2, initValuex, 2)];
    _slideView.backgroundColor = [UIColor redColor];
    [self addSubview:_slideView];
}


-(void)buttonClicked:(UIButton *)button{
    self.index = button.tag - 100;
//    block的回调，当button的index发生变化时，将index的值传给视图控制器
    if (_changeIndexValue) {
        _changeIndexValue(_index);
    }
}
-(void)setIndex:(NSInteger)index{
    //将上一个button设置成未选中状态
    UIButton *notSelectedButton = _buttonArr[_index];
    notSelectedButton.selected = NO;
    UIButton *selectedButton = _buttonArr[index];
    selectedButton.selected = YES;
    
    //设置选中的Button居中
    CGFloat offSetX = selectedButton.frame.origin.x - scrollWidth/2;
    //1、当offSetX的值小于0时（即点击的是中心点左边的button时），让offSetX为0；反之，让offSetX的值为selectedButton.frame.origin.x-kScreenWidth/2+kButtonWidth/2
    offSetX = offSetX > 0 ?(offSetX + buttonWidth/2):0;
    //2、在大于0的情况下，又大于self.contentSize.width - kScreenWidth时，offSetX 的值为self.contentSize.width - kScreenWidth，反之为：selectedButton.frame.origin.x-kScreenWidth/2+kButtonWidth/2
    offSetX = offSetX > self.contentSize.width - scrollWidth ? self.contentSize.width - scrollWidth :offSetX;
    if (_totalvalue < SCREEN_WIDTH) {
    }else
    {
      [UIView animateWithDuration:0.25 animations:^{
        self.contentOffset = CGPointMake(offSetX, 0);
      }];
    }
    _index = index;
    CGRect frame = _slideView.frame;
    frame.origin.x = CGRectGetMinX(selectedButton.titleLabel.frame)+CGRectGetMinX(selectedButton.frame);
    frame.size.width = CGRectGetWidth(selectedButton.titleLabel.frame);
    if (_index == 0) {
        frame.origin.x = (CGRectGetWidth(selectedButton.frame) - [_stringLengthArr[0] floatValue] +20)/2.f;
        frame.size.width = [_stringLengthArr[0] floatValue] -20;
    }

    [UIView animateWithDuration:0.25 animations:^{
        _slideView.frame = frame;
    }];
}

@end
