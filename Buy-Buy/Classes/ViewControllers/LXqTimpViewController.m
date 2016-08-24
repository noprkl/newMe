//
//  LXqTimpViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimpViewController.h"
#import <SDCycleScrollView.h>
#import <MJExtension.h>

#import "LXqTimeCenterView.h"
#import "LXqTimeNEWTableView.h"
#import "LXqTimeDFSTableView.h"

#import "LXqTimeNEWTableModel.h"
#import "LXqTimeDFSTableModel.h"

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
            
            [weakSelf.NEWTableView reloadData];
            return YES;

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
            [weakSelf.DFSTableView reloadData];
            return YES;
        };
    }
    return _centerView;
}

- (LXqTimeNEWTableView *)NEWTableView
{
    if (!_NEWTableView) {
        _NEWTableView = [[LXqTimeNEWTableView alloc] initWithFrame:CGRectMake(0, 280, SCREEN_SIZE.width, _NEWTableView.dataArr.count) style:UITableViewStylePlain];
    }
    return _NEWTableView;
}

- (LXqTimeDFSTableView *)DFSTableView
{
    if (!_DFSTableView) {
        _DFSTableView = [[LXqTimeDFSTableView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width, 280, SCREEN_SIZE.width, _DFSTableView.dataArr.count) style:UITableViewStylePlain];
    }
    return _DFSTableView;
}

#pragma mark - 添加视图
- (void)addSubviews
{
    [self.view addSubview:self.baseScrollview];
    [self.baseScrollview addSubview:self.cycleScrollView];
    
    [self.baseScrollview addSubview:self.NEWTableView];
    [self.baseScrollview addSubview:self.DFSTableView];
    
    [self.baseScrollview addSubview:self.centerView];
   
   
}

#pragma mark - 网络请求
#pragma mark  轮播图片请求
- (void)requestCycleScrollData
{
    /**
     URL:http://123.57.141.249:8080/beautalk/appHome/appHome.do 返回数据:List<Map<String,Object>>
     跳转类型 : RelatedType 无需应用此字段,统一跳转至广告页(含轮播广告位及商品列 表)
     关联ID(活动ID) : RelatedId
     图片地址 : ImgView
     是否有中间页:IfMiddlePage
     */
    [self getRequestWithPath:@"appHome/appHome.do"
                      params:nil success:^(id successJson) {
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

#pragma mark  NEWTabel数据请求
- (void)requestNEWTableViewData
{
    /**
     htp://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do 返回数据:List<Map<String,Object>>
     商品ID : GoodsId
     国家名称 : CountryName
     国旗图片 : CountryImg
     缩略图 :ImgView
     购买数量 : BuyCount
     折扣 :Discount
     商品名称:Title 外币价格:ForeignPrice 人民币价格:Price
     其他价格 :OtherPrice 活动时间(距离结束时间) :RestTime
     */
    [self getRequestWithPath:@"appActivity/appHomeGoodsList.do"
                      params:nil
                     success:^(id successJson) {
                         if (successJson) {
                             self.NEWTableView.dataArr = [LXqTimeNEWTableModel mj_objectArrayWithKeyValuesArray:successJson];
                             //重新布局
                             CGRect rect = self.NEWTableView.frame;
                             rect.size.height = self.NEWTableView.dataArr.count * 170;
                             self.NEWTableView.frame = rect;
                            
                             self.baseScrollview.contentSize = CGSizeMake(0, self.NEWTableView.dataArr.count * 170 + 340);

                             [self.NEWTableView reloadData];
                         }
                     } error:^(NSError *error) {
                         NSLog(@"%@", error);

    }];
}
#pragma mark  DFSTabel数据请求
- (void)requestDFSTableViewData
{
    /**
     URL：htp://123.57.141.249:8080/beautalk/appActivity/appActivityList.do
     返回数据：List<Map<String,Object>>
     */
    [self getRequestWithPath:@"appActivity/appActivityList.do"
                      params:nil
                     success:^(id successJson) {
                         if (successJson) {
                             self.DFSTableView.dataArr = [LXqTimeDFSTableModel mj_objectArrayWithKeyValuesArray:successJson];
                             NSLog(@"%@", self.DFSTableView.dataArr);
                             //重新布局
                             CGRect rect = self.DFSTableView.frame;
                             rect.size.height = self.DFSTableView.dataArr.count * 170;
                             self.DFSTableView.frame = rect;
                             self.baseScrollview.contentSize = CGSizeMake(0, self.DFSTableView.dataArr.count * 170 + 340);
                             
                             [self.DFSTableView reloadData];

                         }
                         
                     } error:^(NSError *error) {
                         NSLog(@"%@", error);
                         
                     }];
}
#pragma mark
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    
    [self addSubviews];
    [self requestCycleScrollData];
    [self requestNEWTableViewData];
    [self requestDFSTableViewData];
}

#pragma mark
#pragma mark -  scrollView代理
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
