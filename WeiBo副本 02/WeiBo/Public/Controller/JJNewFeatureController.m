//
//  JJNewFeatureController.m
//  WeiBo
//
//  Created by 王京 on 15/7/29.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJNewFeatureController.h"
#import "JJTabBarController.h"

@interface JJNewFeatureController ()<UIScrollViewDelegate>

@property (nonatomic,weak)UIPageControl *page;
@property (nonatomic,weak)UIButton *shareBtn;

@end

@implementation JJNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    /**
      *添加scrollView
     */
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.pagingEnabled = YES;//添加分页
    scrollView.showsHorizontalScrollIndicator = NO;//水平滑
    //添加scrollView
    [self.view addSubview:scrollView];
    //循环添加图片
    NSInteger count = 4;
    for (int i = 0; i < count ; ++i) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]];
        //设置图片的位置
        imageView.size = scrollView.size;
        imageView.x = i * SCREENW;
        [scrollView addSubview:imageView];
        /**
         * 最后imageView上添加按钮
         */
        if (i == count-1) {
            [self setupLastPage:imageView];
        }
    }
    //设置scrollView的滚动范围
    scrollView.contentSize = CGSizeMake(SCREENW * count, 0);
    scrollView.delegate = self;
    
    /**
     *  添加page
     */
    UIPageControl *page = [[UIPageControl alloc]init];
    //添加在view上,,添加在scroll上会滚动走
    [self.view addSubview:page];
    //设置page的属性
    page.numberOfPages = count;
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.pageIndicatorTintColor  = [UIColor blackColor];
    //设置位置
    page.centerX = scrollView.width * 0.5;
    page.y = SCREENH - 100;
    self.page = page;
}

//添加登入按钮,,
- (void)setupLastPage:(UIImageView *)imgView{
    imgView.userInteractionEnabled = YES;
    
    //添加进入按钮
    UIButton *enterBtn = [[UIButton alloc]init];
    [imgView addSubview:enterBtn];
    //设置背景,百题
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [enterBtn setTitle:@"进入微博" forState:UIControlStateNormal];
    //设置尺寸
    enterBtn.size = enterBtn.currentBackgroundImage.size;
    enterBtn.centerX = SCREENW * 0.5;
    enterBtn.y = SCREENH - 150;
    //添加点击事件
    [enterBtn addTarget:self action:@selector(enterBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加分享按钮
    UIButton *shareBtn = [[UIButton alloc]init];
    [imgView addSubview:shareBtn];
    
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享到微博" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置尺寸
    [shareBtn sizeToFit];
    shareBtn.centerX = SCREENW * 0.5;
    shareBtn.y = enterBtn.y - 50;
    self.shareBtn = shareBtn;
    //添加点击事件
    [shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark        进入界面,,分享按钮的..点击方法
//进入界面的点击方法
- (void)enterBtnClick{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [JJTabBarController new];
}
//分享按钮的点击方法,,
-(void)shareBtnClick{
    self.shareBtn.selected = !self.shareBtn.selected ;
}

#pragma mark   --scrollView的代理方法
//通过滚动计算page的位置.
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算当前偏移是哪个
    CGFloat num = scrollView.contentOffset.x / scrollView.width;
    //四舍五入
    NSInteger currentNum = (int)(num + 0.5);
    self.page.currentPage = currentNum;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











