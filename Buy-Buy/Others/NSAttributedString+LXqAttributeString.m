//
//  NSAttributedString+LXqAttributeString.m
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//

#define kStringColor [UIColor RGBcolorWithRed:0 green:183 blue:240 alpha:1]

#import "NSAttributedString+LXqAttributeString.h"

@implementation NSAttributedString (LXqAttributeString)
#pragma mark
#pragma mark - 组合字符串富文本
/** 数字(蓝)+字符串（灰） */
+ (NSAttributedString *)attributedStringWithNumber:(NSInteger)num string:(NSString *)string
{
    NSString *numStr = [NSString stringWithFormat:@"%ld", num];
    
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:kStringColor
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:numStr attributes:dict1];
    
    NSDictionary *dict2 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor]
                            };
    NSMutableAttributedString *mutableAttStr2 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict2];
    [mutableAttStr1 insertAttributedString:mutableAttStr2 atIndex:numStr.length];
    
    return [mutableAttStr1 copy];
}
/** 字符串（蓝）+数字（灰） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string number:(NSInteger)num
{
    
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:kStringColor
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict1];
    
    NSString *numStr = [NSString stringWithFormat:@"%ld", num];
    NSDictionary *dict2 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor]
                            };
    NSMutableAttributedString *mutableAttStr2 = [[NSMutableAttributedString alloc] initWithString:numStr attributes:dict2];
    [mutableAttStr1 insertAttributedString:mutableAttStr2 atIndex:string.length];
    
    return [mutableAttStr1 copy];
}
/** 字符串（灰）+字符串（蓝） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string1 string:(NSString *)string2
{
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor]
                            };
    
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string1 attributes:dict1];
    
    NSDictionary *dict2 = @{
                            NSForegroundColorAttributeName:kStringColor
                            };
    NSMutableAttributedString *mutableAttStr2 = [[NSMutableAttributedString alloc] initWithString:string2 attributes:dict2];
    
    [mutableAttStr1 insertAttributedString:mutableAttStr2 atIndex:string1.length];

    return [mutableAttStr1 copy];
}
/** 字符串（红）+ 字符串（灰）*/
+ (NSAttributedString *)attributedStringWithRedString:(NSString *)string1 grayString:(NSString *)string2
{
    NSString *string = [@"¥" stringByAppendingString:string1];
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:255 green:91 blue:61 alpha:1],
                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict1];
    
    NSDictionary *dict2 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:13],
                            NSStrikethroughStyleAttributeName:@(2)
                            };
    NSMutableAttributedString *mutableAttStr2 = [[NSMutableAttributedString alloc] initWithString:string2 attributes:dict2];
    [mutableAttStr1 insertAttributedString:mutableAttStr2 atIndex:string.length];
    
    return [mutableAttStr1 copy];
}
#pragma mark
#pragma mark - 组合字符串富文本
/** 字符串（蓝） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
{
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:kStringColor
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict1];
    
    return [mutableAttStr1 copy];

}
/** 字符串（灰）*/
+ (NSAttributedString *)attributedStringWithGrayString:(NSString *)string
{
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor grayColor]
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict1];
    
    return [mutableAttStr1 copy];
}

/** 字符串 (红) */
+ (NSAttributedString *)attributedStringWithRedString:(NSString *)string
{
    NSDictionary *dict1 = @{
                            NSForegroundColorAttributeName:[UIColor RGBcolorWithRed:255 green:91 blue:61 alpha:1]
                            };
    NSMutableAttributedString *mutableAttStr1 = [[NSMutableAttributedString alloc] initWithString:string attributes:dict1];
    
    return [mutableAttStr1 copy];
}


@end
