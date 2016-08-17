//
//  LXqMyTableModel.h
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXqMyTableModel : NSObject
//表格内容
/** 图片 */
@property (strong, nonatomic) NSString *icon;
/** 文字 */
@property (strong, nonatomic) NSString *title;

+ (NSArray *)loadTableModel;
@end
