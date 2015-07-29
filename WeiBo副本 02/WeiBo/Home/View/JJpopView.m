//
//  JJpopView.m
//  WeiBo
//
//  Created by 王京 on 15/7/29.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJpopView.h"

@interface JJpopView ()

@property (nonatomic,strong)UIImageView *imgView;
@end


@implementation JJpopView

//初始化方法,,customView添加在popBtn的上面
- (instancetype)initWithCustomView:(UIView *)customView{
    self = [super init];
    if (self) {
        //设置当前btn为底部全屏的背景,,
        self.width = SCREENW;
        self.height = SCREENH;
        self.backgroundColor = [UIColor clearColor];
        //添加点击事件
        [self addTarget:self action:@selector(popViewClick) forControlEvents:UIControlEventTouchUpInside];
       
        //添加图片,,图片上加customView
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popover_background"]];
        //添加用户交互
        imgView.userInteractionEnabled = YES;
        
        imgView.width = customView.width + 10;
        imgView.height = customView.height + 20;
        [imgView addSubview:customView];
        self.imgView = imgView;
        
        customView.x = 5;
        customView.y = 12;
        //添加到popb按钮上面..
        [self addSubview:imgView];
    }
    return self;
}

//展示出来,,from..Btn,,使用标题按钮的位置,计算展示框的位置..
- (void)showFromView:(UIView *)showView{
    //根据show的在父控件的相对位置计算    ..nil相当keyWindow
//    CGRect rect = [showView.superview convertRect:showView.frame toView:nil];
    CGRect rect = [showView convertRect:showView.bounds toView:nil];
    self.imgView.centerX = CGRectGetMidX(rect);
    self.imgView.y = CGRectGetMaxY(rect);
    
    //添加在当前window的最上面,,,
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
}

//self按钮点击事件,,
- (void)popViewClick{
    [self removeFromSuperview];
}




@end
