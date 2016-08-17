//
//  UIColor+LXqRandomColor.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "UIColor+LXqRandomColor.h"

@implementation UIColor (LXqRandomColor)

+ (UIColor *)randomColor
{
    CGFloat red = arc4random_uniform(255)/255.0;
    CGFloat green = arc4random_uniform(255)/255.0;
    CGFloat blue = arc4random_uniform(255)/255.0;
    CGFloat alpha = arc4random_uniform(255)/255.0;
   
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
