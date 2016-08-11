//
//  UIButton+tartgetBlock.m
//  blockChain
//
//  Created by foscom on 16/8/1.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "UIButton+tartgetBlock.h"
targetBlockAction midblock;
@implementation UIButton (tartgetBlock)
- (void)addTartgetBlock:(targetBlockAction)targetBlock
{
    midblock = targetBlock;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction
{
    self.selected = !self.selected;
    midblock(self);
}

@end
