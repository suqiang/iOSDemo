//
//  SQHiOSFuntionListController.m
//  iOSDemo
//
//  Created by 苏强 on 16/9/17.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHiOSFuntionListController.h"
#import "SQHItemModel.h"
#import "SQHGroupModel.h"

@interface SQHiOSFuntionListController()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SQHiOSFuntionListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"iOS常用技巧";
    
    SQHGroupModel *imageGroup = [[SQHGroupModel alloc] init];
    imageGroup.title = @"图片相关";
    
    // 图片平铺
    SQHItemModel *itemModel1 = [[SQHItemModel alloc] init];
    itemModel1.title = @"图片平铺✅";
    itemModel1.subtitle = @"颜色图片平铺 & 纯图片平铺";
    itemModel1.clazz = @"SQHImageTileViewController";
    [imageGroup.itemArray addObject:itemModel1];
    
    
    // 图片着色
    SQHItemModel *itemModel2 = [[SQHItemModel alloc] init];
    itemModel2.title = @"图片着色✅";
    itemModel2.subtitle = @"tintColor & UIImageRenderingModeAlwaysTemplate";
    itemModel2.clazz = @"SQHImageTintColorViewController";
    [imageGroup.itemArray addObject:itemModel2];
    
    
    // 图片拉伸
    SQHItemModel *itemModel3 = [[SQHItemModel alloc] init];
    itemModel3.title = @"图片拉伸❌";
    itemModel3.subtitle = @"resizableImageWithCapInsets";
    itemModel3.clazz = @"SQHImageStretchViewController";
    [imageGroup.itemArray addObject:itemModel3];
    [self.dataArray addObject:imageGroup];
    
    
    // 加密
    SQHGroupModel *encryptGroup = [[SQHGroupModel alloc] init];
    encryptGroup.title = @"加密相关";
    
    // 加密算法1（异或加密）
    SQHItemModel *encryptModel = [[SQHItemModel alloc] init];
    encryptModel.title = @"异或加密(XOR)";
    encryptModel.subtitle = @"SQHXOREncryptViewController";
    encryptModel.clazz = @"SQHXOREncryptViewController";
    [encryptGroup.itemArray addObject:encryptModel];
    
    [self.dataArray addObject:encryptGroup];
    
    
    
    
    [self.tableView reloadData];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((SQHGroupModel *)self.dataArray[section]).itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    SQHGroupModel *groupModel = self.dataArray[indexPath.section];
    
    SQHItemModel *itemModel = groupModel.itemArray[indexPath.row];
    
    cell.textLabel.text = itemModel.title;
    cell.detailTextLabel.text = itemModel.subtitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SQHGroupModel *groupModel = self.dataArray[section];

    return groupModel.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SQHGroupModel *groupModel = self.dataArray[indexPath.section];
    
    SQHItemModel *itemModel = groupModel.itemArray[indexPath.row];
    
    UIViewController *vc = [[NSClassFromString(itemModel.clazz) alloc] init];
    vc.title = itemModel.title;
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



@end
