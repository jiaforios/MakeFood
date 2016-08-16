//
//  LoginFootView.h
//  MakeFood
//
//  Created by foscom on 16/8/16.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnActionBlock)(UIButton *sender);

@interface LoginFootView : UIView

@property(nonatomic,strong)btnActionBlock btnBlock;


@end
