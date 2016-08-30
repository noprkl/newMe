//
//  LXqSureGoodsTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSureGoodsTableView.h"
#import "LXqSureGoodsTableViewCell.h"
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
//    return self.dataArr.count;
        return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqSureGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end

