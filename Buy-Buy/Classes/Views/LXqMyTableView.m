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
//        self.bounces = NO;
        
    }
    return self;
}

#pragma mark - 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    if (isLogin.count) {
        return self.dataArr.count;
    }
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"myTableCellcellid";
    LXqMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[LXqMyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
#pragma mark - 模型转数据
    
    cell.myModel = self.dataArr[indexPath.row];
    if ([cell.myModel.title isEqualToString:@"客服热线"]) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"400-6010-545";
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor grayColor];
        [cell addSubview:label];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(cell.mas_centerY);
            make.top.mas_equalTo(cell.mas_top).offset(10);
            make.right.mas_equalTo(cell.mas_right).offset(-20);
        }];
    }
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
#pragma mark - header
//section高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    if (isLogin.count) {
        UIView *footView = [[UIView alloc] initWithFrame:self.tableFooterView.bounds];
        footView.backgroundColor = KMaginBackGround;
        
        UIButton *esitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //退出按钮设置
        [esitBtn setImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:UIControlStateNormal];
        [esitBtn addTarget:self action:@selector(esitMedthod) forControlEvents:UIControlEventTouchDown];
        [footView addSubview:esitBtn];
        
        [esitBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footView.top).offset(40);
            make.left.equalTo(footView.left).offset(50);
            make.right.equalTo(footView.right).offset(-50);
            make.height.equalTo(45);
        }];
        return footView;
    }
    return nil;
}
- (void)esitMedthod
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ISLOGIN"];
    
    if (_reloadBlock) {
        _reloadBlock();
    }
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
