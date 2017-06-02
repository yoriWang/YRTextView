YRTextView
===
对UITextView的简单封装

>>下载项目的demo后，请将图中所示YRTextView文件拖至你的项目中
![github](https://github.com/yoriWang/ImageSources/raw/master/Images/projectImg.png)

在需要添加textview的viewcontroller中导入头文件
```objc
#import "YRTextView.h"
```
.m文件中实现部分
```objc
    YRTextView *textView = [[YRTextView alloc] init];
    textView.alwaysBounceVertical = YES; //垂直方向上具有弹簧效果
    textView.delegate = self;
    textView.frame = self.view.bounds;
    textView.placeholder = @"这边填写占位字符串......";
    textView.placeholderColor = [UIColor orangeColor];
    [self.view addSubview:textView];
```

### 关于placeholder
* 提供可描述输入字段预期值的提示信息
* 该提示会在输入字段为空时显示，并会在字段获得焦点时消失。

### 效果演示
![github](https://github.com/yoriWang/ImageSources/raw/master/Images/yrtextview.gif)




