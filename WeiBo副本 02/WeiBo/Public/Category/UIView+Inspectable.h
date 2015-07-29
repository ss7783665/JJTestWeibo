//
//  UIView+Inspectable.h
//  WeiBo
//
//  Created by 王京 on 15/7/29.
//  Copyright (c) 2015年 wj. All rights reserved.


//使用,,xib右边控制面板有了相关属性设置,,,,Xcode6以后,出来的

#import <UIKit/UIKit.h>

//使用动态渲染##需要自定义View关联XIB才能显示
IB_DESIGNABLE
@interface UIView (Inspectable)

//圆角
@property (nonatomic,assign) IBInspectable CGFloat cornerRadius;
//边框颜色
@property (nonatomic,strong) IBInspectable UIColor *borderColor;
//边框宽度
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@end
