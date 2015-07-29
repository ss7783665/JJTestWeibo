//
//  JJHomeTabController.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJHomeTabController.h"
#import "JJHomeTitleBtn.h"
#import "JJTempViewOne.h"
#import "JJpopView.h"


@interface JJHomeTabController ()

@end

@implementation JJHomeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NV中的title    ..自定义button
    JJHomeTitleBtn *titleBtn = [[JJHomeTitleBtn alloc]init];
    self.navigationItem.titleView = titleBtn;
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    //设置left,,right的按钮,,
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" target:self action:@selector(leftBtnClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" target:self action:@selector(rightBtnClick)];
    
}

#pragma mark    --左边按钮点击事件
- (void)leftBtnClick{
    JJTempViewOne *temp1 = [[JJTempViewOne alloc]init];
    [self.navigationController pushViewController:temp1 animated:YES];
    
}

- (void)rightBtnClick{
    
}


#pragma mark   --标题按钮点击方法
//标题点击弹出一个下拉框
- (void)titleBtnClick:(UIButton *)btn{
    
    //设置一个View,添加在覆盖全屏的btn上面,,
    UIView *customView = [[UIView alloc]init];
    customView.size = CGSizeMake(100, 200);
    customView.backgroundColor = [UIColor purpleColor];
    /**
    *调用popView
     */
    JJpopView *popView = [[JJpopView alloc]initWithCustomView:customView];
    [popView showFromView:btn];
   
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
