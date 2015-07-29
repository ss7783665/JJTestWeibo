//
//  JJpopView.h
//  WeiBo
//
//  Created by 王京 on 15/7/29.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJpopView : UIButton


//初始化方法,,customView添加在popBtn的上面
- (instancetype)initWithCustomView:(UIView *)customView;

//展示出来,,from..Btn,,使用标题按钮的位置,计算展示框的位置..
- (void)showFromView:(UIView *)showView;



@end
