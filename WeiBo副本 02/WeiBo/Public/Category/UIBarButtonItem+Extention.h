//
//  UIBarButtonItem+Extention.h
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)
//设置homeTVC的左右NV按钮
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
//设置left跳转push的界面的左边按钮设定,回退
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action title:(NSString *)title;

@end
