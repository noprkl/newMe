//
//  NSAttributedString+LXqAttributeString.h
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (LXqAttributeString)
#pragma mark
#pragma mark - 组合字符串富文本
/** 数字(蓝)+字符串（灰） */
+ (NSAttributedString *)attributedStringWithNumber:(NSInteger)num string:(NSString *)string;
/** 字符串（蓝）+ 数字（灰） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string number:(NSInteger)num ;
/** 字符串（灰）+字符串（蓝） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string1 string:(NSString *)string2;
/** 字符串（红）+ 字符串（灰）*/
+ (NSAttributedString *)attributedStringWithRedString:(NSString *)string1 grayString:(NSString *)string2;
/** 字符串（红）+ 字符串（灰）+ 字符串（黑）*/
+ (NSAttributedString *)attributedStringWithRedString:(NSString *)string1 grayString:(NSString *)string2 blackString:(NSString *)string3;

#pragma mark
#pragma mark - 字符串富文本
/** 字符串（蓝）*/
+ (NSAttributedString *)attributedStringWithString:(NSString *)string;
/** 字符串（灰）*/
+ (NSAttributedString *)attributedStringWithGrayString:(NSString *)string;
/** 字符串 (红) */
+ (NSAttributedString *)attributedStringWithRedString:(NSString *)string;

@end
