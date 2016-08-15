//
//  CALayer+UIcolor.m
//  MakeFood
//
//  Created by foscom on 16/8/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "CALayer+UIcolor.h"

@implementation CALayer (UIcolor)

- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end
