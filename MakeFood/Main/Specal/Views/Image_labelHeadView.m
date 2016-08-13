//
//  Image_labelHeadView.m
//  MakeFood
//
//  Created by foscom on 16/8/13.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "Image_labelHeadView.h"

@interface Image_labelHeadView ()
@property(nonatomic,strong)UILabel *label;
@end
@implementation Image_labelHeadView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _label = [self makeLabel];
        [self makeFiveButton];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (UILabel *)makeLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150,20)];
    label.text = @"现在流行";
    label.font = [UIFont systemFontOfSize:15];
    [self addSubview:label];
    return label;
}

-(void)makeFiveButton
{
    for (int i = 0; i<5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(SCREEN_WIDTH/5), CGRectGetHeight(_label.frame), (SCREEN_WIDTH/5), self.height- CGRectGetHeight(_label.frame));
        btn.backgroundColor = arcmColor;
        [self addSubview:btn];
    }
}
@end
