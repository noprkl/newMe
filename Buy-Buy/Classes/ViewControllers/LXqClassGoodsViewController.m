//
//  LXqClassGoodsViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassGoodsViewController.h"

#import "LXqClassGoodsHeaderView.h"
#import "LXqClassGoodsCollectionView.h"

@interface LXqClassGoodsViewController ()

/** 头部 */
@property (strong, nonatomic) LXqClassGoodsHeaderView *headerView;
/** collection */
@property (strong, nonatomic) LXqClassGoodsCollectionView *collectionView;
@end

@implementation LXqClassGoodsViewController
- (LXqClassGoodsHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LXqClassGoodsHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 44)];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.hostBtnBlock = ^(){
            return YES;
        };
        _headerView.priceBtnBlock = ^(){
            return YES;
        };
        _headerView.scoreBtnBlock = ^(){
            return YES;
        };
        _headerView.timeBtnBlock = ^(){
            return YES;
        };
    }
    return _headerView;

}
- (LXqClassGoodsCollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[LXqClassGoodsCollectionView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_SIZE.width, SCREEN_SIZE.height - 108) collectionViewLayout:flow];
        
        _collectionView.backgroundColor = KMaginBackGround;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.cellTitle;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
}
- (void)requestClassGoodsData
{

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
