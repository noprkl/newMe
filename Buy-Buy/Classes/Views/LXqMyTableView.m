//
//  LXqMyTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
// 

#import "LXqMyTableView.h"
#import "LXqMyTableModel.h"
#import "LXqMyTableViewCell.h"

@interface LXqMyTableView ()<UITableViewDataSource, UITableViewDelegate>
/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

@end
@implementation LXqMyTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
      
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

#pragma mark - 代理
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    LXqMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[LXqMyTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
#pragma mark - 模型转数据
    
    cell.myModel = self.dataArr[indexPath.row];
    if (indexPath.row == 3) {
    
        cell.detailTextLabel.text = @"400-6010-545";

    }else{
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
//section高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - 数据源加载
- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [LXqMyTableModel loadTableModel];
    }
    return _dataArr;
}

@end
