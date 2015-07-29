//
//  JJTabBar.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJTabBar.h"

@interface JJTabBar ()

@property (nonatomic,weak) UIButton *plusBtn;

@end


@implementation JJTabBar

#pragma mark    --初始化,添加UIButton
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //添加自定义button
        UIButton *btn = [[UIButton alloc]init];
        //设置背景图和image
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        //设置尺寸
        btn.size = btn.currentBackgroundImage.size;
        [btn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.plusBtn = btn;
        [self addSubview:btn];
    }
    return self;
}

//dynamic—>告诉父类的代理在父类实现了,
@dynamic delegate;

#pragma mark --加号按钮的点击方法
- (void)plusBtnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(tabBar:plusBtnDidClick:)]) {
        [self.delegate tabBar:self plusBtnDidClick:btn];
    }
}

#pragma mark  --布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    //设置加号按钮
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    //设置btn的宽度
    CGFloat bottomBtnW = self.width * 0.2;
    NSInteger index = 0;
    
    for (int i = 0; i < self.subviews.count ; ++i) {
        UIView *view = self.subviews[i];
            //判断是否是类型,,,tabbar里面不止只用tabbarButoon
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            view.x = index * bottomBtnW;
            view.width = bottomBtnW;
            if (index > 1) {
                view.x = (index+1) * bottomBtnW;
            }
            index ++;
        }
    }
}


@end
