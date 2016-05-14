//
//  SecondViewController.h
//  页面跳转
//
//  Created by 李佳骏 on 15/9/14.
//  Copyright (c) 2015年 李佳骏. All rights reserved.
//

#import <UIKit/UIKit.h>

// 1⃣️声明一个block返回值void参数为字符串类型
typedef void (^ablock)(NSString *str);

@interface SecondViewController : UIViewController

@property (nonatomic, strong) UITextField *textfield;

// 1⃣️定义一个block的属性
@property (nonatomic, copy) ablock block;

@end
