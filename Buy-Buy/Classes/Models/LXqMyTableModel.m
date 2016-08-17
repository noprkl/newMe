//
//  LXqMyTableModel.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqMyTableModel.h"

@implementation LXqMyTableModel
+ (NSArray *)loadTableModel{
    NSString *string = [[NSBundle mainBundle] pathForResource:@"LXqMyTableModel.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:string];
    
    //
    NSMutableArray *dataArr = [NSMutableArray array];
    //朋友分组
    for (NSDictionary *dict in dictArr) {
        
        LXqMyTableModel *model = [[LXqMyTableModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dict];
        
        [dataArr addObject:model];
    }
    
    return dataArr;
}
@end
