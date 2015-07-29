//
//  JJSearchView.m
//  WeiBo
//
//  Created by 王京 on 15/7/28.
//  Copyright (c) 2015年 wj. All rights reserved.
//

#import "JJSearchView.h"

@interface JJSearchView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constant;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end



@implementation JJSearchView

//调用方法
+ (instancetype)searcheView{
    return [[[NSBundle mainBundle] loadNibNamed:@"JJSearchView" owner:nil options:nil] lastObject];
}

//xib加载完成后调用,设置属性,,initWithCoder执行完(只能添加子控件)
- (void)awakeFromNib{
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    
    //设置imageV的内容模式,,不然图片拉伸
    leftImage.contentMode = UIViewContentModeCenter;
    leftImage.width = 30;
    self.searchField.leftView = leftImage;
    
    //设置文本框的左View的类型,,默认不显示...
    self.searchField.leftViewMode = UITextFieldViewModeAlways;
    //设置代理,,监听点击
    self.searchField.delegate = self;
    
//    //设置圆角       -->使用UIViewXib相关分类
//    self.searchField.layer.cornerRadius = 5;
//    self.searchField.layer.masksToBounds =YES;
    
}

//搜索文本框的代理方法..
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //设置距离右边的布局距离,,动画效果
    self.constant.constant = self.cancelBtn.width;
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
    
    
}

//取消按钮点击事件,,,
- (IBAction)cancelBtnClick:(UIButton *)sender {
    self.constant.constant = 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
    [self endEditing:YES];
}







@end














