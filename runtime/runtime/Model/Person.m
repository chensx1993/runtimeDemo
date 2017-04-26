//
//  Person.m
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat {
    NSLog(@"I am eatting");
}

+ (void)eat {
    NSLog(@"类方法: [Person eat]");
}

@end
