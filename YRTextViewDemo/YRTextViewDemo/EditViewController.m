//
//  EditViewController.m
//  YRTextViewDemo
//
//  Created by 王煜仁 on 2017/6/2.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "EditViewController.h"
#import "YRTextView.h"

@interface EditViewController ()<UITextViewDelegate>
@property (nonatomic, weak) YRTextView *textView;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavItem];
    
    [self setupTextViewComponent];
    
}

#pragma mark - 设置导航栏左右按钮
- (void)setupNavItem {
    
    self.title = @"编辑界面";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendMsg)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

#pragma mark - YRTextView调用
- (void)setupTextViewComponent {
    
    YRTextView *textView = [[YRTextView alloc] init];
    textView.alwaysBounceVertical = YES; //垂直方向上具有弹簧效果
    textView.delegate = self;
    textView.frame = self.view.bounds;
    textView.placeholder = @"这边填写占位字符串......";
    textView.placeholderColor = [UIColor orangeColor];
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.font = [UIFont systemFontOfSize:15.f];
    //唤起键盘
    [self.textView becomeFirstResponder];
}

#pragma mark - UIScrollView Delegate拖拽的时候，隐藏键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - 取消、发送方法
- (void)cancel {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendMsg {
    
    if (self.textView.text.length == 0) {
        [self cancel];
        return;
    }
    
    [self alertControllerWithTitle:@"提示" message:self
     .textView.text];
}

#pragma mark - UItextview delegate 监听是否有文本输入
- (void)textViewDidChange:(UITextView *)textView {
    self.navigationItem.rightBarButtonItem.enabled = (textView.text.length != 0);
}


#pragma mark - 私有方法   弹框显示要发送的消息   作为测试使用  实际开发中可移除
- (void)alertControllerWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view endEditing:YES];
        [self cancel];
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
