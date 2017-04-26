//
//  NSMutableArray+Swizzle.m
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import "NSMutableArray+Swizzle.h"
#import <objc/runtime.h>
#import "NSObject+Swizzle.h"

@implementation NSMutableArray (Swizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
           [objc_getClass("__NSArrayM") swizzleMethod:@selector(addObject:) withMethod:@selector(addNilOrObject:) error:nil];
        }
       
    });
}

- (void)addNilOrObject:(id)object {
    if (object) {
        [self addNilOrObject:object];
    }
}

@end
