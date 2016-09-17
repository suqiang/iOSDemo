//
//  SQHImageTileViewController.m
//  iOSDemo
//
//  Created by 苏强 on 16/9/17.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHImageTileViewController.h"

@interface SQHImageTileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation SQHImageTileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.imageView.layer.borderWidth = 1;
    self.imageView.layer.masksToBounds = YES;
    
    // 图片实现
    UIImage *image = [UIImage imageNamed:@"sqh_image_tile_16x16"];
    UIImage *tiledImage = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    self.imageView.image = tiledImage;
    
    
    
    self.imageView2.layer.borderColor = [UIColor orangeColor].CGColor;
    self.imageView2.layer.borderWidth = 1;
    self.imageView2.layer.masksToBounds = YES;
    
    // 颜色实现
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.imageView2.backgroundColor = color;
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
