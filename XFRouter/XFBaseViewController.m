//
//  XFBaseViewController.m
//  XFRouter
//
//  Created by xiefei on 2018/7/9.
//  Copyright © 2018年 xiefei. All rights reserved.
//

#import "XFBaseViewController.h"

@interface XFBaseViewController ()

@end

@implementation XFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavibar];
    // Do any additional setup after loading the view.
}

- (void)setUpNavibar
{
    UIBarButtonItem *pulishButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:(UIBarButtonItemStyle)UITabBarSystemItemContacts target:self action:@selector(backBtnClick)];
    [pulishButton setTintColor:[UIColor blueColor]];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects: pulishButton,nil]];
}
                                
- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
