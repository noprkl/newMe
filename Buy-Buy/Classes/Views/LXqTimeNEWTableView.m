//
//  LXqTimeNEWTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeNEWTableView.h"
#import "LXqTimeNEWTableViewCell.h"
#import "LXqTimeNEWTableModel.h"

#import <MJExtension.h>
static NSString *cellid = @"NEWTableCellid";

@interface LXqTimeNEWTableView ()<UITableViewDataSource, UITableViewDelegate>
///** 数据源 */
//@property (strong, nonatomic) NSArray *dataArr;
@end

@implementation LXqTimeNEWTableView

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = KMLineColor;
        self.bounces = NO;
        [self registerClass:[LXqTimeNEWTableViewCell class] forCellReuseIdentifier:cellid];
        
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqTimeNEWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.NEWTableModel = self.dataArr[indexPath.row];
   
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

@end
