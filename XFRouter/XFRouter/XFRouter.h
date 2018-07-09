//
//  JDRouter.h
//  RouterTest
//
//  Created by xiefei on 2018/7/6.
//  Copyright © 2018年 xiefei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 组件对外公开接口, m组件名, i接口名, p(arg)接收参数, c(callback)回调block
#define XFROUTER_EXTERN_METHOD(m,i,p,c) + (id) routerHandle_##m##_##i:(NSDictionary*)arg callback:(id)callback

@interface XFRouter : NSObject

+(void)openURL:(NSString *)stringUrl arg:(NSDictionary *)param error:(NSError *)error callBack:(void (^)(void))callBack;

@end
