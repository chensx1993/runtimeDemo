//
//  NSArray+Swizzle.m
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import "NSArray+Swizzle.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSArray (Swizzle)


/**
 dispatch_once这里不是“单例”，是保证方法替换只执行一次
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //NSArray 没找到方法
        //[object_getClass((id)self) swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(nilOrObjectAtIndex:) error:nil];
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(nilOrObjectAtIndex2:) error:nil];
        [objc_getClass("__NSCFArray") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(nilOrObjectAtIndex3:) error:nil];
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(nilOrObjectAtIndex4:) error:nil];
        [objc_getClass("__NSArray0") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(nilOrObjectAtIndex5:) error:nil];

        
    });
}

- (id)nilOrObjectAtIndex5:(NSInteger)index  {
    if (index < self.count && index >= 0) {
        return [self nilOrObjectAtIndex5:index];
    }
    return nil;
}

- (id)nilOrObjectAtIndex4:(NSInteger)index  {
    if (index < self.count && index >= 0) {
        return [self nilOrObjectAtIndex4:index];
    }
    return nil;
}

- (id)nilOrObjectAtIndex3:(NSInteger)index  {
    if (index < self.count && index >= 0) {
        return [self nilOrObjectAtIndex3:index];
    }
    return nil;
}

- (id)nilOrObjectAtIndex2:(NSInteger)index  {
    if (index < self.count && index >= 0) {
        return [self nilOrObjectAtIndex2:index];
    }
    return nil;
}

- (id)nilOrObjectAtIndex:(NSInteger)index {
    if (index < self.count && index >= 0) {
        return [self nilOrObjectAtIndex:index];
    }
    return nil;
}


@end
