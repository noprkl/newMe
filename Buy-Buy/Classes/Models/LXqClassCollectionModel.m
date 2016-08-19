//
//  LXqClassCollectionModel.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassCollectionModel.h"

@implementation LXqClassCollectionModel

+ (NSArray *)loadColoectionModel{
    NSString *string = [[NSBundle mainBundle] pathForResource:@"LXqClassCollectionModel.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:string];
    
    //
    NSMutableArray *dataArr = [NSMutableArray array];
    //朋友分组
    for (NSDictionary *dict in dictArr) {
        
        LXqClassCollectionModel *model = [[LXqClassCollectionModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dict];
        
        [dataArr addObject:model];
    }
    
    return [dataArr copy];
}

@end
