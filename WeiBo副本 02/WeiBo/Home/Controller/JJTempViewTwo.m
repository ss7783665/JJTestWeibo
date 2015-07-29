//
//  JJTempViewTwo.m
//  WeiBo
//
//  Created by 王京 on 15/7/28.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJTempViewTwo.h"

@interface JJTempViewTwo ()

@end

@implementation JJTempViewTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"temp2";
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back_withtext" target:self action:@selector(backBtnClick) title:@"返回"];
}
//- (void)backBtnClick{
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
