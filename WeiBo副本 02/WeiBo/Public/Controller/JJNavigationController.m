//
//  JJNavigationController.m
//  WeiBo
//
//  Created by 王京 on 15/7/28.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJNavigationController.h"

@interface JJNavigationController ()

@end

@implementation JJNavigationController

//重写push方法...
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSString *backStr = @"返回";
    //第一个要跳转,,rootV是第一个
    if (self.childViewControllers.count == 1) {
        backStr = [[self.childViewControllers firstObject] title];
    }
    //第一个加载的时候..还没有执行super,,,为0,第一个不设置,,
    if (self.childViewControllers.count) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back_withtext" target:self action:@selector(backBtnClick) title:backStr];
        
        //隐藏底部栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句代码要放在最后,,
    [super pushViewController:viewController animated:YES];
}

- (void)backBtnClick{
    [self popViewControllerAnimated:YES];
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
