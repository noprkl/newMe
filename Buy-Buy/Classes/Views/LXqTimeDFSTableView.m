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

@end

@implementation LXqTimeDFSTableView
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
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqTimeDFSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
  
    cell.textLabel.text = [NSString stringWithFormat:@"DFSTableCell--%ld", indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}


@end
