//
//  JJHomeTitleBtn.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJHomeTitleBtn.h"

@implementation JJHomeTitleBtn
//设置尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    //自定义文字和图片的位置
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) +5;
    //+5需要设置宽度
    self.width = CGRectGetMaxX(self.imageView.frame);
    self.centerX = self.superview.centerX;
}
//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"首页" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        //设置尺寸
        [self sizeToFit];
    }
    return self;
}





@end
