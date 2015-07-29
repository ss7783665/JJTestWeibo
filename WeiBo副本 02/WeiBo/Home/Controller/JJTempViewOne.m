//
//  JJTempViewOne.m
//  WeiBo
//
//  Created by 王京 on 15/7/28.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJTempViewOne.h"
#import "JJTempViewTwo.h"

@implementation JJTempViewOne


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"temp1";
    
    
    //重写了NV得push方法,,在跳转的时候设置了left
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back_withtext" target:self action:@selector(backBtnClick) title:@"首页"];
    
}
//- (void)backBtnClick{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//增加触摸事件跳转界面
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    JJTempViewTwo *temp2 = [[JJTempViewTwo alloc]init];
    [self.navigationController pushViewController:temp2 animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
