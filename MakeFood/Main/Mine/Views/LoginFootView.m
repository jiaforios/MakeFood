//
//  LoginFootView.m
//  MakeFood
//
//  Created by foscom on 16/8/16.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "LoginFootView.h"
@implementation LoginFootView


- (instancetype)init
{
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"LoginFootView" owner:nil options:nil][0];
    }
    return self;
}


- (IBAction)wechatAction:(id)sender {

    _btnBlock(sender);
    
}


@end
