//
//  UIColor+LXqRandomColor.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LXqRandomColor)

/** 随机色 */
+ (UIColor *)randomColor;

/** rgb颜色 */
+ (UIColor *)RGBcolorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end
