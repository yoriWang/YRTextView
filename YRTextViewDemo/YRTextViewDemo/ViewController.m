//
//  ViewController.m
//  YRTextViewDemo
//
//  Created by 王煜仁 on 2017/6/2.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "EditViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupEditButton];
}

#pragma mark - 设置跳转到编辑界面的按钮
- (void)setupEditButton {
    
    UIButton *button = [[UIButton alloc] init];
    button.yr_x = self.view.yr_width / 4;
    button.yr_width = self.view.yr_width / 2;//SCREEN_WIDTH / 2;
    button.yr_height = 30.f;
    button.yr_y = (self.view.yr_height - button.yr_height) / 2;
    [button addTarget:self action:@selector(clickButtonToEdit:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击跳转到编辑界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma mark - 跳转
- (void)clickButtonToEdit:(UIButton *)button {
    
    EditViewController *editVC = [[EditViewController alloc] init];
    UINavigationController *naVc = [[UINavigationController alloc] initWithRootViewController:editVC];
    [self presentViewController:naVc animated:YES completion:nil];
}

@end
