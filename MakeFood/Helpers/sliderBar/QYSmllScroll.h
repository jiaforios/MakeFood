//
//  QYSmllScroll.h
//  笑霸
//
//  Created by qingyun on 16/1/26.
//  Copyright (c) 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYSmllScroll : UIScrollView<UIScrollViewDelegate>

-(instancetype)initWithSmllScroll:(NSArray *)arrays;
@property (nonatomic) NSInteger index;
@property (nonatomic, strong) void (^changeIndexValue)(NSInteger);
@end
