//
//  LXqTimeDFSTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeDFSTableView.h"
#import "LXqTimeDFSTableViewCell.h"

static NSString *cellid = @"DFSTableCellid";

@interface LXqTimeDFSTableView ()<UITableViewDataSource, UITableViewDelegate>
///** 数据源 */
//@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation LXqTimeDFSTableView
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
        self.bounces = NO;
        [self registerClass:[LXqTimeDFSTableViewCell class] forCellReuseIdentifier:cellid];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqTimeDFSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
  
    cell.DFSModel = self.dataArr[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
#pragma mark
#pragma mark - 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_pushDFSBlock) {
        _pushDFSBlock();
    }
}

@end
