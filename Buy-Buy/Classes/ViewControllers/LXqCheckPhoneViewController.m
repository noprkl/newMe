//
//  LXqCheckPhoneViewController.m
//  Buy-Buy
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqCheckPhoneViewController.h"
#import "LXqCheckPhoneView.h"

@interface LXqCheckPhoneViewController ()
/** 注册View */
@property (strong, nonatomic) LXqCheckPhoneView *checkView;
@end

@implementation LXqCheckPhoneViewController
- (LXqCheckPhoneView *)checkView
{
    if (!_checkView) {
        _checkView = [[LXqCheckPhoneView alloc] initWithFrame:self.view.bounds];
    }
    return _checkView;;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    self.view.backgroundColor = KMaginBackGround;
    [self.view addSubview:self.checkView];
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
