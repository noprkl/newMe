//
//  LXqShopGoodsTableView.m
//  Buy-Buy
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXqShopGoodsTableView.h"
#import "LXqShopGoodsTableViewCell.h"

#import "LXqShopGoodsModel.h"
static NSString *cellid = @"ShopGoodsTableCellid";

@interface LXqShopGoodsTableView ()<UITableViewDataSource, UITableViewDelegate>
/** 数据源 */
@property (strong, nonatomic) NSMutableArray *dataArr;
/** 选中的 */
@property (strong, nonatomic) NSMutableArray *selectdeArr;
@end

@implementation LXqShopGoodsTableView
- (NSMutableArray *)selectdeArr
{
    if (!_selectdeArr) {
        _selectdeArr = [NSMutableArray array];
    }
    return _selectdeArr;
}
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)setShopGoodsData:(NSArray *)shopGoodsData
{
    _shopGoodsData = shopGoodsData;
    self.dataArr = [LXqShopGoodsModel mj_objectArrayWithKeyValuesArray:shopGoodsData];
    self.selectdeArr = [self.dataArr mutableCopy];
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = KMLineColor;
        [self registerClass:[LXqShopGoodsTableViewCell class] forCellReuseIdentifier:cellid];
        self.backgroundColor = KMaginBackGround;
        
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXqShopGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    LXqShopGoodsModel *goodsModel = self.dataArr[indexPath.row];
#pragma mark
#pragma mark - 点击cell
    cell.addBlock = ^(){
        goodsModel.GoodsCount += 1;
        [self reloadData];
    };
    cell.cutBlock = ^(){
        goodsModel.GoodsCount -= 1;
        [self reloadData];
    };
    cell.shopGoodsModel = goodsModel;
    if ([self.selectdeArr containsObject:self.dataArr[indexPath.row]]) {
        cell.selectImageView.image = [UIImage imageNamed:@"购物车界面商品选中对号按钮"];
    }else{
        cell.selectImageView.image = [UIImage imageNamed:@"购物车界面商品未选中"];
    }
    if (cell.shopGoodsModel.GoodsCount <= 0) {
        [self.dataArr removeObject:self.dataArr[indexPath.row]];
        [self reloadData];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark
#pragma mark - 头尾
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.selectdeArr containsObject:self.dataArr[indexPath.row]]) {
      
        [self.selectdeArr removeObject:self.dataArr[indexPath.row]];

    } else {
        [self.selectdeArr addObject:self.dataArr[indexPath.row]];
    }
    if (_selectedBlock) {
        _selectedBlock(self.selectdeArr);
    }
    [tableView reloadData];
}
#pragma mark
#pragma mark - 代理
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArr removeObject:self.dataArr[indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
@end
