//
//  JJTabBarController.m
//  WeiBo
//
//  Created by 王京 on 15/7/27.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJTabBarController.h"
#import "JJTabBar.h"
#import "JJHomeTabController.h"
#import "JJNavigationController.h"
#import "JJDiscoverController.h"

@interface JJTabBarController ()<JJTabBarDelegate>

@end

@implementation JJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
      *  self.tabBar是只读的....通过KVC设置tabBar
     */
    JJTabBar *tabbar = [[JJTabBar alloc]init];
    //tab系统的会设置自己为代理/在初始化之前先设自己就可以
    tabbar.delegate = self;
    [self setValue:tabbar forKey:@"tabBar"];

    //设置4个子控制器
    JJHomeTabController *home = [[JJHomeTabController alloc]init];
    [self addChildViewCtrl:home withImageName:@"tabbar_home" title:@"主页"];
    
    UITableViewController *message = [[UITableViewController alloc]init];
    [self addChildViewCtrl:message withImageName:@"tabbar_message_center" title:@"信息"];
    JJDiscoverController *discover = [[JJDiscoverController alloc]init];
    [self addChildViewCtrl:discover withImageName:@"tabbar_discover" title:@"发现"];
    UITableViewController *profile = [[UITableViewController alloc]init];
    [self addChildViewCtrl:profile withImageName:@"tabbar_profile" title:@"我"];
}

#pragma mark    --tabBar加号按钮点击的代理方法
//临时
- (void)tabBar:(JJTabBar *)tabbar plusBtnDidClick:(UIButton *)btn{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor purpleColor];
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(tempbtnClick)];
    
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
    nv.modalPresentationStyle = UIModalPresentationFormSheet;
    nv.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:nv animated:YES completion:nil];
}
//temp
- (void)tempbtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark   ----子控制器方法提取
//子控制器方法提取
- (void)addChildViewCtrl:(UIViewController *)childCtrl withImageName:(NSString *)imageName title:(NSString *)title{
    
    //设置tabbar的title和颜色设置   --一句title相当设置导航栏和tabbar的tilte了
    childCtrl.title = title;
    //tintColor颜色设置,就可以设置颜色..
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //字体可以修改
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    //  dic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childCtrl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //设置图片
    childCtrl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //用自定义NV包装一下
    JJNavigationController *nv = [[JJNavigationController alloc]initWithRootViewController:childCtrl];
    //添加子控制器
    [self addChildViewController:nv];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
