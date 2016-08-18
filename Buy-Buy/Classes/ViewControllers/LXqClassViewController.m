//
//  LXqClassViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqClassViewController.h"
#import "LXqClassCollectionView.h"

@interface LXqClassViewController ()

/** 表格 */
@property (strong, nonatomic) LXqClassCollectionView *collectionView;
@end

@implementation LXqClassViewController
- (LXqClassCollectionView *)collectionView
{
    if (!_collectionView) {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[LXqClassCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    }
    
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
