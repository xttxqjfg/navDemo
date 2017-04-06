//
//  UIViewController+SMA.m
//  navDemo
//
//  Created by 易博 on 2017/4/5.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "UIViewController+SMA.h"
#import "UINavigationController+SMA.h"
#import <objc/runtime.h>

@implementation UIViewController (SMAUI)

//属性对应的key 必须是C语言字符串
static char *SMAUI = "SMAUI";

-(void)setNavBarBgAlpha:(NSString *)navBarBgAlpha{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, SMAUI, navBarBgAlpha, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // 设置导航栏透明度（利用Category自己添加的方法）
    [self.navigationController setNavigationBackground:[navBarBgAlpha floatValue]];
}

-(NSString *)navBarBgAlpha{
    return objc_getAssociatedObject(self, SMAUI);
}

@end
