//
//  MineHeadView.m
//  MakeFood
//
//  Created by foscom on 16/8/16.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "MineHeadView.h"
@implementation MineHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"MineHeadView" owner:nil options:nil][0];
        self.frame = frame;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    return self;
}
- (IBAction)toLogInVCAction:(id)sender {
 
    _loginblock(sender);
}
- (IBAction)toRegisteVC:(id)sender {
    _registblock(sender);

}

@end
