//
//  LXqSearchViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSearchViewController.h"

@interface LXqSearchViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 搜索框 */
@property (strong, nonatomic) UISearchBar *searchBar;
/** 搜索结果 */
@property (strong, nonatomic) UISearchDisplayController *resultController;
@end

@implementation LXqSearchViewController
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}
#pragma mark
#pragma mark - 添加控件
- (void)addSubViews
{
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
   
    self.navigationItem.titleView = self.searchBar;

}
#pragma mark
#pragma mark - 懒加载
- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width - 40, 25)];
        _searchBar.placeholder = @"商品/功效/品牌";
        //进入就进入编辑状态
        [_searchBar becomeFirstResponder];
        _searchBar.showsCancelButton = YES;

    }
    return _searchBar;
}
- (UISearchDisplayController *)resultController
{
    if (!_resultController) {
        _resultController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
        _resultController.searchResultsDelegate = self;
        _resultController.searchResultsDataSource = self;
    }
    return _resultController;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"searchResultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
