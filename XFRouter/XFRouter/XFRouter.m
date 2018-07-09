//
//  JDRouter.m
//  RouterTest
//
//  Created by xiefei on 2018/7/6.
//  Copyright © 2018年 xiefei. All rights reserved.
//

#import "XFRouter.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation XFRouter
#pragma mark - public methods

+ (instancetype)sharedInstance
{
    static XFRouter *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[XFRouter alloc] init];
    });
    return mediator;
}

+(void)openURL:(NSString *)stringUrl arg:(NSDictionary *)param error:(NSError *)error callBack:(void (^)(void))callBack
{
    if (![stringUrl containsString:@"router://"]) {
        NSLog(@"不合法的router");
        return;
    }
    
    NSString *moduleStr = nil;
    NSString *actionStr = nil;
    
    if (!param) {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        
        NSArray *urlElementsArrary = [stringUrl componentsSeparatedByString:@"//"];
        NSString *pathStr = [urlElementsArrary lastObject];
        
        if ([stringUrl containsString:@"?"]) {
            NSArray *paramsArrary = [stringUrl componentsSeparatedByString:@"?"];
            NSString *paramsStr = [paramsArrary lastObject];
            
            for (NSString *paramStr in [paramsStr componentsSeparatedByString:@"&"]) {
                NSArray *elts = [paramStr componentsSeparatedByString:@"="];
                if([elts count] < 2) continue;
                [params setObject:[elts lastObject] forKey:[elts firstObject]];
            }
            NSArray *pathStrArrary = [pathStr componentsSeparatedByString:@"?"];
            pathStr = [pathStrArrary firstObject];

        }
        param = params;
        
        NSArray *pathElementsArrary = [pathStr componentsSeparatedByString:@"/"];
        moduleStr = [pathElementsArrary firstObject];
        actionStr = [pathElementsArrary lastObject];
    }else
    {
        if ([stringUrl containsString:@"?"]) {
            NSLog(@"不合法的router");
            return;
        }
        
        NSArray *urlElementsArrary = [stringUrl componentsSeparatedByString:@"//"];
        NSString *pathStr = [urlElementsArrary lastObject];
        
        NSArray *pathElementsArrary = [pathStr componentsSeparatedByString:@"/"];
        moduleStr = [pathElementsArrary firstObject];
        actionStr = [pathElementsArrary lastObject];
    }
        
    NSString *routerStr = [NSString stringWithFormat:@"routerHandle_%@_%@:callback:",moduleStr,actionStr];
    
    Class targetClass = NSClassFromString(moduleStr);
    SEL action = NSSelectorFromString(routerStr);
    
    ((void(*)(id,SEL,id,id))objc_msgSend)(targetClass, action,param,callBack);
    if (callBack) {
        callBack();
    }
}

//如需增加参数参考以下方法
/*
- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params
{
    NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) {
        return nil;
    }
    const char* retType = [methodSig methodReturnType];
    
    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}
 */

@end
