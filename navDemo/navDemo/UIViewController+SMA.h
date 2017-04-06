//
//  UIViewController+SMA.h
//  navDemo
//
//  Created by 易博 on 2017/4/5.
//  Copyright © 2017年 易博. All rights reserved.
//

#import <UIKit/UIKit.h>

///为系统的UIViewController动态增加属性

@interface UIViewController (SMAUI)

//vc的导航bar背景透明度
@property (copy,nonatomic) NSString *navBarBgAlpha;

@end
