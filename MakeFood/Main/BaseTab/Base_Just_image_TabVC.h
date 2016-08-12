//
//  Base_Just_image_TabVC.h
//  MakeFood
//
//  Created by foscom on 16/8/12.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, TABVHEADKIND) {
    HEAD_KIND_NONE,
    HEAD_KIND_SPECAL,
    HEAD_KIND_FASION,
};
/**
 *   this tabview is base use for all table view
 *  if a VC has the same functions you can use this base tabview
 * this baseVc can give a api for url and wether has head
 * this can alse define the head ,when make its subview you can use different head to make your view show
 */



@interface Base_Just_image_TabVC : UITableViewController

/**
 *  define a urlStr which can use a dataSource
 */
@property (nonatomic,copy)NSString *urlStr;

/**
 *  define a king of head which can define how a tabv show
 */
@property (nonatomic,assign)TABVHEADKIND kind;


@end
