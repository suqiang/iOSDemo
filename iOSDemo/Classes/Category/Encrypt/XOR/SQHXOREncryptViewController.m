//
//  SQHXOREncryptViewController.m
//  iOSDemo
//
//  Created by 苏强 on 16/11/2.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQHXOREncryptViewController.h"
#import "SQHXOREncryptUtil.h"

@interface SQHXOREncryptViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, assign, getter=isEncrypted) BOOL encrypted;

@property (nonatomic, strong) NSData *data;

@end

@implementation SQHXOREncryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.textView.layer.borderWidth = 1.0f;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];

    self.data = [NSData dataWithContentsOfFile:filePath];
    
    self.textView.text = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    
}
- (IBAction)encrypt:(UIButton *)sender {
    self.data = [self.data xor_encrypt];
    self.textView.text = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    self.encrypted = YES;
    // 实际项目中写入沙盒，或者直接内置到资源包内，或者直接通过服务器获取
    [self.data writeToFile:@"/Users/suqiang/Desktop/xor_encrypt.json" atomically:YES];
}
- (IBAction)decrypt:(UIButton *)sender {
    self.data = [self.data xor_decrypt];
    self.textView.text = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    self.encrypted = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



@end
