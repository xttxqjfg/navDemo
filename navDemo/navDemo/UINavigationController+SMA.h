//
//  UINavigationController+SMA.h
//  navDemo
//
//  Created by 易博 on 2017/4/5.
//  Copyright © 2017年 易博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SMAUI) <UINavigationBarDelegate,UINavigationControllerDelegate>

/**
 设置导航栏背景透明度

 @param alpha 透明度的浮点值
 */
-(void)setNavigationBackground:(CGFloat)alpha;

@end
