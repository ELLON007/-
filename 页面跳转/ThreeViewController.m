//
//  ThreeViewController.m
//  页面跳转
//
//  Created by 李佳骏 on 15/9/16.
//  Copyright (c) 2015年 李佳骏. All rights reserved.
//

#import "ThreeViewController.h"
#import "SecondViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    //2⃣️ block回调
    if (self.returnBlock) {
        self.returnBlock();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)textAction:(UITextField *)sender {
    
    
}

// 点击空白收回键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_threeTextField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
