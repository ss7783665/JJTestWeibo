//
//  UIBarButtonItem+Extention.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "UIBarButtonItem+Extention.h"

@implementation UIBarButtonItem (Extention)

//设置homeTVC的左右NV按钮
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    //自定义btn
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    //设置尺寸
    [btn sizeToFit];
    //增加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

//设置left跳转push的界面的左边按钮设定,
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action title:(NSString *)title{
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kRGB(68, 68, 68, 1) forState:UIControlStateNormal];
    //设定尺寸
    [btn sizeToFit];
    //添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


@end









