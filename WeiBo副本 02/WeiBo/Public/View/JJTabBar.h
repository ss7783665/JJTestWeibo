//
//  JJTabBar.h
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理方法
@class JJTabBar;
@protocol JJTabBarDelegate <NSObject,UITabBarDelegate>

- (void)tabBar:(JJTabBar *)tabbar plusBtnDidClick:(UIButton *)btn;

@end





@interface JJTabBar : UITabBar

@property(nonatomic,weak) id <JJTabBarDelegate> delegate;

@end
