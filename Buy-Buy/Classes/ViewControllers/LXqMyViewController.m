//
//  LXqMyViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#import "LXqMyViewController.h"
#import "UIColor+LXqRandomColor.h"
#import "LXqMyTableView.h"
#import "LXqMyHeaderView.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
