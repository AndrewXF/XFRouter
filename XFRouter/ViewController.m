//
//  ViewController.m
//  RouterTest
//
//  Created by xiefei on 2018/7/6.
//  Copyright © 2018年 xiefei. All rights reserved.
//

#import "ViewController.h"
#import "XFRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpButton];
    
    [self.navigationItem setLeftBarButtonItems:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpButton
{
    self.title = @"主页";
    UIButton *purpleView = [UIButton buttonWithType:UIButtonTypeCustom];
    [purpleView setTitle:@"进入test组件页面1" forState:UIControlStateNormal];
    [purpleView addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    purpleView.backgroundColor = [UIColor purpleColor];
    // 禁止将 AutoresizingMask 转换为 Constraints
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:purpleView];
    
    UIButton *purpleView1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [purpleView1 setTitle:@"进入test组件页面2" forState:UIControlStateNormal];
    [purpleView1 addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    purpleView1.backgroundColor = [UIColor purpleColor];
    // 禁止将 AutoresizingMask 转换为 Constraints
    purpleView1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:purpleView1];
    
    
    // 添加 width 约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:200];
    [purpleView addConstraint:widthConstraint];
    // 添加 height 约束
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
    [purpleView addConstraint:heightConstraint];
    
    
    // 添加 width 约束
    NSLayoutConstraint *widthConstraint1 = [NSLayoutConstraint constraintWithItem:purpleView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:200];
    [purpleView1 addConstraint:widthConstraint1];
    // 添加 height 约束
    NSLayoutConstraint *heightConstraint1 = [NSLayoutConstraint constraintWithItem:purpleView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150];
    [purpleView1 addConstraint:heightConstraint1];
    
    
    
    // 添加 left 约束
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100];
    [self.view addConstraint:leftConstraint];
    // 添加 top 约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200];
    [self.view addConstraint:topConstraint];
    
    
    // 添加 left 约束
    NSLayoutConstraint *leftConstraint1 = [NSLayoutConstraint constraintWithItem:purpleView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100];
    [self.view addConstraint:leftConstraint1];
    // 添加 top 约束
    NSLayoutConstraint *topConstraint1 = [NSLayoutConstraint constraintWithItem:purpleView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:500];
    [self.view addConstraint:topConstraint1];
}

- (void)test1
{
    NSDictionary *paramDict = @{@"from":@"test",@"todo":@"goto"};
    [XFRouter openURL:@"router://TestModule/gotoView1" arg:paramDict error:nil callBack:^{
        NSLog(@"______________callBack_______________");
    }];
}

- (void)test2
{
    [XFRouter openURL:@"router://TestModule/gotoView2?from=test&todo=goto" arg:nil error:nil callBack:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
