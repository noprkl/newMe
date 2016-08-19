//
//  NSAttributedString+LXqAttributeString.h
//  Buy-Buy
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (LXqAttributeString)

/** 数字(蓝)+字符串（灰） */
+ (NSAttributedString *)attributedStringWithNumber:(NSInteger)num string:(NSString *)string;
/** 字符串（蓝）+数字（灰） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string number:(NSInteger)num ;
/** 字符串（灰）+字符串（蓝） */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string1 string:(NSString *)string2;
/** 字符串（蓝）*/
+ (NSAttributedString *)attributedStringWithString:(NSString *)string;
/** 字符串（灰）*/
+ (NSAttributedString *)attributedStringWithGrayString:(NSString *)string;

@end
