//
//  UIView+GestureActionBlock.h
//  blockChain
//
//  Created by foscom on 16/8/1.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GestureActionBlock)
typedef void(^GestureBlock)(UIView *GestureView);
- (void)addTapGestureActionWithBlck:(GestureBlock)gestureBlock;
- (void)addTapGestureActionWithTap:(unsigned int)tapCount WithBlck:(GestureBlock)gestureBlock;
@end
