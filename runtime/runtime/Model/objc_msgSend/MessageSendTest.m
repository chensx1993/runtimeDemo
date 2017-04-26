//
//  MessageSendTest.m
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import "MessageSendTest.h"

@implementation MessageSendTest

- (void)noArgumentsAndNoReturnValue {
    NSLog(@"方法名: %s", __FUNCTION__);
}

- (void)hasArguments:(NSString *)arg {
    NSLog(@"方法名: %s, 参数: %@",__FUNCTION__, arg);
}

- (NSString *)noArgumentsButReturnValue {
    NSString *returnValue = @"不带参数，但是带有返回值";
    NSLog(@"方法名: %s, 返回值: %@",__FUNCTION__, returnValue);
    return returnValue;
}

- (int)hasArguments:(NSString *)arg andReturnValue:(int)returnValue {
    NSLog(@"方法名: %s, 参数: %@, 返回值: %d", __FUNCTION__, arg, returnValue);
    return returnValue;
}

@end
