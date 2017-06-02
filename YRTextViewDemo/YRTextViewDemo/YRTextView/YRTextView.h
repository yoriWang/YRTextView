//
//  YRTextView.h
//  FollowYouHeart
//
//  Created by 王煜仁 on 2017/3/4.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRTextView : UITextView

/**
 设置占位字体
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 设置占位字体颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
