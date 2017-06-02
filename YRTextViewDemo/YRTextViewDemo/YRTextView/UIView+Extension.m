//
//  UIView+Extension.m
//  FollowYouHeart
//
//  Created by 王煜仁 on 2017/2/26.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setYr_x:(CGFloat)yr_x {
    CGRect frame = self.frame;
    frame.origin.x = yr_x;
    self.frame = frame;
}

- (CGFloat)yr_x {
    return self.frame.origin.x;
}

- (void)setYr_y:(CGFloat)yr_y {
    CGRect frame = self.frame;
    frame.origin.y = yr_y;
    self.frame = frame;
}

- (CGFloat)yr_y {
    return self.frame.origin.y;
}

- (void)setYr_width:(CGFloat)yr_width {
    CGRect frame = self.frame;
    frame.size.width = yr_width;
    self.frame = frame;
}

- (CGFloat)yr_width {
    return self.frame.size.width;
}

- (void)setYr_height:(CGFloat)yr_height {
    CGRect frame = self.frame;
    frame.size.height = yr_height;
    self.frame = frame;
}

- (CGFloat)yr_height {
    return self.frame.size.height;
}


- (void)setYr_size:(CGSize)yr_size {
    CGRect frame = self.frame;
    frame.size = yr_size;
    self.frame = frame;
}

- (CGSize)yr_size {
    return self.frame.size;
}

@end
