//
//  LXqTimpViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimpViewController.h"
#import <SDCycleScrollView.h>

#import "LXqTimeCenterView.h"
#import "LXqTimeNEWTableView.h"
#import "LXqTimeDFSTableView.h"

@interface LXqTimpViewController ()<SDCycleScrollViewDelegate, UIScrollViewDelegate>

/** 放置scrollview */
@property (strong, nonatomic) UIScrollView *baseScrollview;
/** 轮播视图 */
@property (strong, nonatomic) SDCycleScrollView  *cycleScrollView;
/** 放置按钮的View */
@property (strong, nonatomic) LXqTimeCenterView *centerView;
/** table1 */
@property (strong, nonatomic) LXqTimeNEWTableView *NEWTableView;
@property (strong, nonatomic) LXqTimeDFSTableView *DFSTableView;
@end

@implementation LXqTimpViewController
#pragma mark - 懒加载
- (UIScrollView *)baseScrollview
{
    if (!_baseScrollview) {
        _baseScrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _baseScrollview.contentSize = CGSizeMake(0, 2100);
        _baseScrollview.delegate = self;
        _baseScrollview.showsVerticalScrollIndicator = NO;
    }
    return _baseScrollview;
}
- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 230) delegate:self placeholderImage:[UIImage imageNamed:@"image0"]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.autoScrollTimeInterval = 3;
    }
    return _cycleScrollView;
}
- (LXqTimeCenterView *)centerView
{
    if (!_centerView) {
        _centerView = [[LXqTimeCenterView alloc] initWithFrame:CGRectMake(0, 230, SCREEN_SIZE.width, 50)];
        _centerView.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        _centerView.NEWBtnBlock = ^(){

            [UIView animateWithDuration:1 animations:^{
                CGRect NewTableRect = weakSelf.NEWTableView.frame;
                CGRect PriceTableRect = weakSelf.DFSTableView.frame;
                NewTableRect.origin.x = 0;
                PriceTableRect.origin.x = SCREEN_SIZE.width;
                
                weakSelf.NEWTableView.frame = NewTableRect;
                weakSelf.DFSTableView.frame = PriceTableRect;
            }];
        };
        _centerView.DFSBtnBlock = ^(){
            [UIView animateWithDuration:1 animations:^{
                CGRect NewTableRect = weakSelf.NEWTableView.frame;
                CGRect PriceTableRect = weakSelf.DFSTableView.frame;
                NewTableRect.origin.x = -SCREEN_SIZE.width;
                PriceTableRect.origin.x = 0;
                weakSelf.NEWTableView.frame = NewTableRect;
                weakSelf.DFSTableView.frame = PriceTableRect;
            }];

        
        };
    }
    return _centerView;
}

#pragma mark - 按钮动画

- (LXqTimeNEWTableView *)NEWTableView
{
    if (!_NEWTableView) {
        _NEWTableView = [[LXqTimeNEWTableView alloc] initWithFrame:CGRectMake(0, 280, SCREEN_SIZE.width, 1700) style:UITableViewStylePlain];
        _NEWTableView.bounces = NO;
    }
    return _NEWTableView;
}
- (LXqTimeDFSTableView *)DFSTableView
{
    if (!_DFSTableView) {
        _DFSTableView = [[LXqTimeDFSTableView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width, 280, SCREEN_SIZE.width, 1700) style:UITableViewStylePlain];
        _DFSTableView.backgroundColor = [UIColor blueColor];
        
        _DFSTableView.bounces = NO;
        
    }
    return _DFSTableView;
}
#pragma mark - 方法
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollview];
    [self.baseScrollview addSubview:self.cycleScrollView];

    [self.baseScrollview addSubview:self.NEWTableView];
    [self.baseScrollview addSubview:self.DFSTableView];

    [self.baseScrollview addSubview:self.centerView];
   
    
}

#pragma mark
#pragma mark -  按钮停留
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect rect = self.centerView.frame;

    if (scrollView.contentOffset.y > 230) {
        rect.origin.y = scrollView.contentOffset.y;
    }else{
        rect.origin.y = 230;
    }
    self.centerView.frame = rect;
}
#pragma mark
#pragma mark - 网络请求

- (void)requestData
{
    /**
     URL:http://123.57.141.249:8080/beautalk/appHome/appHome.do 返回数据:List<Map<String,Object>>
     跳转类型 : RelatedType 无需应用此字段,统一跳转至广告页(含轮播广告位及商品列 表)
     关联ID(活动ID) : RelatedId
     图片地址 : ImgView
     是否有中间页:IfMiddlePage
     */
    [self getRequestWithPath:@"appHome/appHome.do" params:nil success:^(id successJson) {
        NSLog(@"%@", successJson);
        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSDictionary *dict in successJson) {
            NSString *imageUrl = dict[@"ImgView"];
            [dataArr addObject:imageUrl];
        }
        self.cycleScrollView.imageURLStringsGroup = dataArr;
        
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    
    [self addSubviews];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
