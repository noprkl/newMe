//
//  LXqMyViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//  个人中心

#import "LXqMyViewController.h"
#import "LXqMyTableView.h"
#import "LXqMyHeaderView.h"
#import "LXqRegisteViewController.h"

@interface LXqMyViewController ()

/** 头部view */
@property (strong, nonatomic) LXqMyHeaderView *headerView;

/** tableView */
@property (strong, nonatomic) LXqMyTableView *tableVew;
@end

@implementation LXqMyViewController
#pragma mark - 头部
- (LXqMyHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LXqMyHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 200)];
        
        //注册按钮跳转
        __weak typeof(self) weakself = self;
        _headerView.registeBlock=^{
            LXqRegisteViewController * regisVC = [[LXqRegisteViewController alloc] init];
            [weakself.navigationController pushViewController:regisVC animated:YES];
        };
           }
    return _headerView;
}
#pragma mark - table
- (LXqMyTableView *)tableVew
{
    if (!_tableVew) {
        _tableVew = [[LXqMyTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        CGRect rect = _tableVew.frame;
        rect.origin.y = CGRectGetMaxY(self.headerView.bounds);
        _tableVew.frame = rect;
    }
    return _tableVew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableVew];
    
}
//另一种约束
//- (void)addSubviews
//{
//    self.edgesForExtendedLayout = 0;
//    
//    [self.headerView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.top);
//        make.size.equalTo(CGSizeMake(SCREEN_SIZE.width, 200));
//    }];
//    [self.tableVew makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headerView.bottom);
//    }];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
