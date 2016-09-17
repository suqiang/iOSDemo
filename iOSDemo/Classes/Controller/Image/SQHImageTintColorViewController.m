//
//  SQHImageTintColorViewController.m
//  iOSDemo
//
//  Created by 苏强 on 16/9/17.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHImageTintColorViewController.h"

@interface SQHImageTintColorViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation SQHImageTintColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:@"sqh_image_placeholder"];
    
    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self updateTintColor];
    self.imageView.image = templateImage;
    
}

- (IBAction)redSliderValueChanged:(UISlider *)sender {
     [self updateTintColor];
}

- (IBAction)greenSliderValueChanged:(UISlider *)sender {
     [self updateTintColor];
}

- (IBAction)blueSliderValueChanged:(UISlider *)sender {
    [self updateTintColor];
}

- (void)updateTintColor
{
    UIColor *tintColor = [UIColor colorWithRed:self.redSlider.value/ 256.0
                                         green:self.greenSlider.value/ 256.0
                                          blue:self.blueSlider.value/ 256.0
                                         alpha:1];
    
    self.imageView.tintColor = tintColor;
    
    self.colorLabel.text = [NSString stringWithFormat:@"tintColor: R: %.1f\t  G: %.1f\t  B: %.1f", self.redSlider.value, self.greenSlider.value, self.blueSlider.value];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
