//
//  MessageSendTest.h
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageSendTest : NSObject

- (void)noArgumentsAndNoReturnValue;

- (void)hasArguments:(NSString *)arg;

- (NSString *)noArgumentsButReturnValue;

- (int)hasArguments:(NSString *)arg andReturnValue:(int)returnValue;

@end
