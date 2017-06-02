//
//  YRTextView.m
//  FollowYouHeart
//
//  Created by 王煜仁 on 2017/3/4.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "YRTextView.h"
#import "UIView+Extension.h"

@interface YRTextView()
@property (nonatomic, weak) UILabel *placeholderLabel;
@end

@implementation YRTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        //设置默认的placeholder显示颜色
        self.placeholderColor = [UIColor lightGrayColor];
        
        //设置默认字体大小
        self.font = [UIFont systemFontOfSize:14.f];
        
        //监听的方法
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    [self setNeedsLayout];
    
}

#pragma mark - 通知--监听文字改变
- (void)textDidChange {
    self.placeholderLabel.hidden = (self.text.length != 0);
}
#pragma mark - 公共方法
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self textDidChange];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.placeholderLabel.yr_x = 5.f;
    self.placeholderLabel.yr_y = 8.f;
    self.placeholderLabel.yr_width = self.yr_width - 2 * self.placeholderLabel.yr_x;
    
    CGSize maxSize = CGSizeMake(self.placeholderLabel.yr_width, MAXFLOAT);
    CGSize autoSize = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    self.placeholderLabel.yr_height = autoSize.height;
}

#pragma mark - 释放通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
