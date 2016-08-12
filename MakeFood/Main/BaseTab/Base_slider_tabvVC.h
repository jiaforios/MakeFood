//
//  Base_slider_tabvVC.h
//  MakeFood
//
//  Created by foscom on 16/8/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "BaseViewController.h"
#import "Base_Just_image_TabVC.h"

/**
 *  this vc is a kind vc of sliderBar and tabview
 */
@interface Base_slider_tabvVC : BaseViewController

/**
 *  the slider dataArr
 */
@property(nonatomic,strong)NSArray *sliderDataArray;

/**
 *  url of dataSource
 */
@property(nonatomic, copy)NSString *urlStr;

/**
 *  kind of tabv
 */
@property(nonatomic, assign)TABVHEADKIND tabKind;

@end
