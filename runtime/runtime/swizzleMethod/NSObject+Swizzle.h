//
//  NSObject+Swizzle.h
//  runtime
//
//  Created by chensx on 17/4/21.
//  Copyright © 2017年 app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;

@end
