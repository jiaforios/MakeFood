//
//  Define.h
//  MakeFood
//
//  Created by foscom on 16/8/11.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGH  [UIScreen mainScreen].bounds.size.height
#define Color(a,b,c) ([UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:1])
#define ColorAlpha(a,b,c,d) ([UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:d])
#define BaseColor ColorAlpha(240,240,240,1)
#define arcmColor  Color(arc4random()%256, arc4random()%256, arc4random()%256)
#define barHeight 40
#define viewStatPlace barHeight + 64


#endif /* Define_h */
