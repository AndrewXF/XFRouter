//
//  TestModule.m
//  RouterTest
//
//  Created by xiefei on 2018/7/6.
//  Copyright © 2018年 xiefei. All rights reserved.
//

#import "TestModule.h"
#import "TestModuleViewController.h"
#import "TestModuleViewController1.h"
#import "XFRouter.h"
#import "XFNavigationTool.h"

@implementation TestModule

XFROUTER_EXTERN_METHOD(TestModule, gotoView1, arg, callback) {
    NSLog(@"gotoView1 get arg=%@",arg);
    
    TestModuleViewController *view = [[TestModuleViewController alloc] init];
    [[XFNavigationTool currentNavigationVC] pushViewController:view animated:YES];
 
    return nil;
}

XFROUTER_EXTERN_METHOD(TestModule, gotoView2, arg, callback) {
    NSLog(@"gotoView2 get arg=%@",arg);

    TestModuleViewController1 *view = [[TestModuleViewController1 alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:view animated:YES completion:nil];

    return nil;
}

@end
