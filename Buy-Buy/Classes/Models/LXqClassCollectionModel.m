//
//  LXqClassCollectionModel.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassCollectionModel.h"
#import "LXqClassName.h"

@implementation LXqClassCollectionModel

+ (NSArray *)loadColoectionModel{
    NSString *string = [[NSBundle mainBundle] pathForResource:@"test.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:string];
    
    //
    NSMutableArray *dataArr = [NSMutableArray array];
    //朋友分组
    for (NSDictionary *collectionModeldict in dictArr) {
        
        LXqClassCollectionModel *model = [[LXqClassCollectionModel alloc] init];
        
        [model setValuesForKeysWithDictionary:collectionModeldict];
        
        NSMutableArray *classArr = [NSMutableArray array];
        for (NSDictionary *classesDict in model.classes) {
            
            LXqClassName *classes = [[LXqClassName alloc] init];
            [classes setValuesForKeysWithDictionary:classesDict];
            
            [classArr addObject:classes];
        }
        
        model.classes = classArr;
        [dataArr addObject:model];
    }
    
    return [dataArr copy];
}

@end
