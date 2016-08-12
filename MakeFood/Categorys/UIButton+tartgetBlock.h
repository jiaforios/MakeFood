//
//  UIButton+tartgetBlock.h
//  blockChain
//
//  Created by foscom on 16/8/1.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^targetBlockAction)(UIButton* obj);

@interface UIButton (tartgetBlock)

- (void)addTartgetBlock:(targetBlockAction)targetBlock;



@end
