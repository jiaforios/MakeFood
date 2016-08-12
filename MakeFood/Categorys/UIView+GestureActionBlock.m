//
//  UIView+GestureActionBlock.m
//  blockChain
//
//  Created by foscom on 16/8/1.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "UIView+GestureActionBlock.h"

@implementation UIView (GestureActionBlock)
GestureBlock midBlock;

- (void)addTapGestureActionWithBlck:(GestureBlock)gestureBlock
{
    midBlock = gestureBlock;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
}

- (void)addTapGestureActionWithTap:(unsigned int)tapCount WithBlck:(GestureBlock)gestureBlock
{
    midBlock = gestureBlock;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.numberOfTapsRequired = tapCount;
    [self addGestureRecognizer:tap];

}
- (void)tapAction
{
    midBlock(self);
}


@end
