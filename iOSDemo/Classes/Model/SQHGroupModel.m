//
//  SQHGroupModel.m
//  iOSDemo
//
//  Created by 苏强 on 16/9/17.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHGroupModel.h"

@interface SQHGroupModel()
@property (nonatomic, strong) NSMutableArray *itemArray;
@end

@implementation SQHGroupModel

- (NSMutableArray *)itemArray
{
    if (nil == _itemArray) {
        _itemArray = [NSMutableArray array];
    }
    
    return _itemArray;
}

@end
