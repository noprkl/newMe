//
//  LXqTimeNEWTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimeNEWTableView.h"
#import "LXqTimeNEWTableViewCell.h"

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
    __weak typeof(cell) weakCell = cell;
    cell.NEWGoodidBlock = ^(UIButton *shopCarBtn){
        [self performSelector:@selector(getGoodidAction:) withObject:weakCell.NEWTableModel.GoodsId];
    };
    return cell;
}
- (void)getGoodidAction:(NSString *)goodId
{
    if (_NEWgoodidBlock) {
        _NEWgoodidBlock(goodId);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}
#pragma mark
#pragma mark - 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_pushNEWBlock) {
        _pushNEWBlock([self.dataArr[indexPath.row] GoodsId], [self.dataArr[indexPath.row] CountryImg]);
    }
    
}
@end
