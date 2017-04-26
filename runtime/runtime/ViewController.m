//
//  ViewController.m
//  runtime
//
//  Created by chensx on 17/4/20.
//  Copyright © 2017年 app. All rights reserved.
//
// 参考: http://www.cnblogs.com/jys509/p/5207159.html
// http://www.jianshu.com/p/ab966e8a82e2

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>

#import "NSArray+Swizzle.h"
#import "NSMutableArray+Swizzle.h"
#import "MessageSendTest.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (IBAction)buttonDidClicked:(id)sender {
    [self test];
}

- (void)test {
    //[self sendMessage];
    
    [self sendMessage2];
    
    [self swizzleMethod];
}

#pragma mark - Swizzle Method

- (void)swizzleMethod {
    NSArray *array = @[@1, @"hehe"];
    NSLog(@"=======swizzleMethod: 数组越界预防闪退: %@", array[2]);
    
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"1111", nil];
    NSString *string;
    [array2 addObject:string];
    NSLog(@"=======swizzleMethod: 数组可以添加nil对象: %@",array2);
}

#pragma mark - objc_msgSend
/**
 发送消息
 */
- (void)sendMessage {
    
    /**
     在使用objc_msgSend方法编译时可能出现报错的情况，对应的解决办法如下：
     build Settings:  Enable Strict Checking of objc_msgSend Calls 设置为 no
     */
    
    //MessageSendTest *test = [MessageSendTest alloc];
    MessageSendTest *test = objc_msgSend([MessageSendTest class], @selector(alloc));
    
    //[test init]
    test = objc_msgSend(test, @selector(init));
    
    //[test noArgumentsAndNoReturnValue]
    ((void(*)(id,SEL))objc_msgSend)(test, @selector(noArgumentsAndNoReturnValue));
    
    //带参数 没有返回值
    ((void(*)(id, SEL, NSString *))objc_msgSend)(test, @selector(hasArguments:), @"带一参数但是没有返回值");
    
    //不带参数 有返回值
    NSString *returnStr = ((NSString * (*) (id, SEL))objc_msgSend)((id)test, @selector(noArgumentsButReturnValue));
    NSLog(@"返回值为：%@", returnStr);
    
    //有参数 有返回值
    int returnInt = ((int (*)(id, SEL, NSString *, int))objc_msgSend)((id)test, @selector(hasArguments:andReturnValue:), @"参数1", 1024);
    NSLog(@"return value is %d", returnInt);
}

- (void)sendMessage2 {
    Person *p = [[Person alloc] init];
    
    //调用对象方法
    [p eat];
    
    //本质: 让对象发送消息
    objc_msgSend(p, @selector(eat));
    
    //调用类方法的方式: 两种
    //1.类名调用
    [Person eat];
    //2.类对象调用
    [[Person class] eat];
    
    //用类名调用类方法，底层会自动把类名调换成类对象调用
    //本质: 让类对象发送消息
    objc_msgSend([Person class], @selector(eat));
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    unsigned int count = 0;
    Class *classes = objc_copyClassList(&count);
    for (int i = 0; i < count; i++) {
        const char *className = class_getName(classes[i]);
        printf("类名: %s\n", className);
    }
    printf("=========================");
}

@end
