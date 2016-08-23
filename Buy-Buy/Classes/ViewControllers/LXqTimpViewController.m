//
//  LXqTimpViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimpViewController.h"
#import <SDCycleScrollView.h>


#import "LXqNewTableView.h"
#import "LXqPriceTableView.h"

@interface LXqTimpViewController ()<SDCycleScrollViewDelegate, UIScrollViewDelegate>

/** 放置scrollview */
@property (strong, nonatomic) UIScrollView *baseScrollview;
/** 轮播视图 */
@property (strong, nonatomic) SDCycleScrollView  *cycleScrollView;
/** 放置按钮的View */
@property (strong, nonatomic) UIView *twoBtnView;
/** 新品团购Button */
@property (strong, nonatomic) UIButton *NewBtn;
/** 品牌团购 */
@property (strong, nonatomic) UIButton *PriceBtn;
/** 放置tableView的View */
@property (strong, nonatomic) UIView *twoTableView;
/** table1 */
@property (strong, nonatomic) LXqNewTableView *NewTableView;
@property (strong, nonatomic) LXqPriceTableView *PriceTableView;
@end

@implementation LXqTimpViewController
#pragma mark - 懒加载
- (UIScrollView *)baseScrollview
{
    if (!_baseScrollview) {
        _baseScrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _baseScrollview.contentSize = CGSizeMake(0, 1980);
        _baseScrollview.backgroundColor = [UIColor orangeColor];
        _baseScrollview.delegate = self;
        _baseScrollview.showsVerticalScrollIndicator = NO;
    }
    return _baseScrollview;
}
- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 230) delegate:self placeholderImage:[UIImage imageNamed:@"image0"]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.autoScrollTimeInterval = 2;
        
    }
    return _cycleScrollView;
}
- (UIView *)twoBtnView
{
    if (!_twoBtnView) {
        _twoBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 230, SCREEN_SIZE.width, 50)];
        [_twoBtnView addSubview:self.NewBtn];
        [_twoBtnView addSubview:self.PriceBtn];
    }
    return _twoBtnView;
}
- (UIButton *)NewBtn
{
    if (!_NewBtn) {
        _NewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_NewBtn setTitle:@"新品团购" forState:UIControlStateNormal];
        _NewBtn.backgroundColor = [UIColor randomColor];

//        [_NewBtn addTarget:self action:@selector(transAnimation) forControlEvents:UIControlEventTouchDown];
//        _NewBtn.selected = YES;
    }
    return _NewBtn;
}

- (UIButton *)PriceBtn
{
    if (!_PriceBtn) {
        _PriceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_PriceBtn setTitle:@"品牌团购" forState:UIControlStateNormal];
        _PriceBtn.backgroundColor = [UIColor randomColor];
//        [_PriceBtn addTarget:self action:@selector(transAnimation) forControlEvents:UIControlEventTouchDown];
    }
    return _PriceBtn;
}
#pragma mark - 转场动画

- (LXqNewTableView *)NewTableView
{
    if (!_NewTableView) {
        _NewTableView = [[LXqNewTableView alloc] initWithFrame:CGRectMake(0, 280, SCREEN_SIZE.width, 1700) style:UITableViewStylePlain];
        _NewTableView.backgroundColor = [UIColor purpleColor];
        _NewTableView.bounces = NO;
    }
    return _NewTableView;
}
- (LXqPriceTableView *)PriceTableView
{
    if (!_PriceTableView) {
        _PriceTableView = [[LXqPriceTableView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width, 280, SCREEN_SIZE.width, 1700) style:UITableViewStylePlain];
        _PriceTableView.backgroundColor = [UIColor blueColor];
        
        _PriceTableView.bounces = NO;
        
    }
    return _PriceTableView;
}
#pragma mark - 方法
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollview];
    [self.baseScrollview addSubview:self.cycleScrollView];

    [self.baseScrollview addSubview:self.NewTableView];
    [self.baseScrollview addSubview:self.PriceTableView];

    [self.baseScrollview addSubview:self.twoBtnView];
   
    
}
#pragma mark - 约束
- (void)makeConstraints
{
    [self.cycleScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseScrollview.top);
        make.left.equalTo(self.baseScrollview.left);
        make.width.equalTo(SCREEN_SIZE.width);
        make.height.equalTo(230);
    }];
    [self.NewBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoBtnView.top);
        make.left.equalTo(self.twoBtnView.left);
        make.bottom.equalTo(self.twoBtnView.bottom);
        make.right.equalTo(self.twoBtnView.centerX);
    }];
    
    [self.PriceBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoBtnView.top);
        make.right.equalTo(self.twoBtnView.right);
        make.bottom.equalTo(self.twoBtnView.bottom);
        make.left.equalTo(self.twoBtnView.centerX);
    }];
    
}
//按钮停留
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    if (scrollView.contentOffset.y > 230) {
        CGRect rect = self.twoBtnView.frame;
        rect.origin.y = scrollView.contentOffset.y;
        self.twoBtnView.frame = rect;
    }else{
        CGRect rect = self.twoBtnView.frame;
        rect.origin.y = 230;
        self.twoBtnView.frame = rect;
    }
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    
    [self addSubviews];
    [self makeConstraints];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
