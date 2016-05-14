//
//  ThreeViewController.h
//  页面跳转
//
//  Created by 李佳骏 on 15/9/16.
//  Copyright (c) 2015年 李佳骏. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThreeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UITextField *threeTextField;

// 2⃣️block 回传
@property (nonatomic, copy)void(^returnBlock)();

@end
