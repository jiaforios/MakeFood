//
//  ImageTextButton.m
//  FOSCAM_NVR
//
//  Created by foscom on 16/7/25.
//  Copyright © 2016年 foscam. All rights reserved.
//

#import "ImageTextButton.h"

@implementation ImageTextButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
   return CGRectMake(5, 0, 40, 20);//图片的位置大小
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(5, 25,40,14);//文本的位置大小
}
@end
