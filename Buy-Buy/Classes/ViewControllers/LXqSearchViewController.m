//
//  LXqSearchViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqSearchViewController.h"

@interface LXqSearchViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.searchBar becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.searchBar resignFirstResponder];
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
        _searchBar.returnKeyType = UIReturnKeySearch;
        _searchBar.delegate = self;
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
#pragma mark
#pragma mark - 代理

#pragma mark UISearchBarDelegate
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSDictionary *parmae = @{
                             @"search":searchBar.text
                             };
    [self getRequestWithPath:@"appSearch/searchList.do" params:parmae success:^(id successJson) {
        MyLog(@"searchBarBookmark%@", successJson);
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    /**
     URL：htp://123.57.141.249:8080/beautalk/appSearch/searchList.do 传入数据：    搜索关键字： search
     排序字段：OrderName   【热卖：host；价格：price；新品：time；好评：score】默认为host
     排序类型：OrderType    【正序：ASC；倒序：DESC】
     注：OrderName为time是OrderType为ASC；其他为EDSC
     返回参数：List<Map<String,Object>>
     商品ID ： GoodsId     国家名称 ： CountryName国旗图片 ： CountryImg
     缩略图 ：ImgView     购买数量 ： BuyCount     折扣 ：Discount
     商品名称：Title     外币价格：ForeignPrice    人民币价格：Price
     其他价格 ：OtherPrice     活动时间（距离结束时间） ：RestTime
     */
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //点击cancel按钮 返回原来界面
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark UITableViewDelegate
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


@end
