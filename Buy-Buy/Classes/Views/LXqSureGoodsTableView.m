//
//  LXqSureGoodsTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSureGoodsTableView.h"
#import "LXqSureGoodsTableViewCell.h"
#import "LXqGoodsSureListModel.h"

static NSString *cellid = @"SureGoodsTableCellid";

@interface LXqSureGoodsTableView ()<UITableViewDataSource, UITableViewDelegate>
/** 数据源 */
@property (strong, nonatomic) NSMutableArray *dataArr;

@end
@implementation LXqSureGoodsTableView
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)setSureGoodsData:(NSArray *)sureGoodsData
{
    _sureGoodsData = sureGoodsData;
    self.dataArr = [LXqGoodsSureListModel mj_objectArrayWithKeyValuesArray:sureGoodsData];
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = KMLineColor;
        [self registerClass:[LXqSureGoodsTableViewCell class] forCellReuseIdentifier:cellid];
        self.backgroundColor = KMaginBackGround;
        
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqSureGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.goodsModel = self.dataArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

