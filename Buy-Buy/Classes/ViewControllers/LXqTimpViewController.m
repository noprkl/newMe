//
//  LXqTimpViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqTimpViewController.h"

@interface LXqTimpViewController ()
/** 放置scrollview */
@property (strong, nonatomic) UIScrollView *baseScrollview;
/** 轮播视图 */
@property (strong, nonatomic) UIScrollView  *scrollView;
/** 放置按钮 */
@property (strong, nonatomic) UIView *twoBtnView;
/** 放置tableView */
@property (strong, nonatomic) UIView *twoTableView;
@end

@implementation LXqTimpViewController
- (UIScrollView *)baseScrollview
{
    if (!_baseScrollview) {
        _baseScrollview = [[UIScrollView alloc] init];
        
    }
    return _baseScrollview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];

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
