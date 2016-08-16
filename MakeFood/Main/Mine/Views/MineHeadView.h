//
//  MineHeadView.h
//  MakeFood
//
//  Created by foscom on 16/8/16.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)(UIButton *btn);
typedef void(^registBlock)(UIButton *btn);

@interface MineHeadView : UIView


@property(nonatomic,strong)loginBlock loginblock;
@property(nonatomic,strong)registBlock registblock;

@end
