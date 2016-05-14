//
//  SecondViewController.m
//  页面跳转
//
//  Created by 李佳骏 on 15/9/14.
//  Copyright (c) 2015年 李佳骏. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "Masonry.h"
#import "ThreeViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor redColor];
    [self setView];
    
}

- (void)setView{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"返回第一个页面" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
        make.top.mas_equalTo(100);
    }];
    
    UITextField *textfield = [UITextField new];
    self.textfield = textfield;
    textfield.backgroundColor = [UIColor whiteColor];
    [textfield setPlaceholder:@"请输入您的姓名"];
    [self.view addSubview:textfield];
    
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button);
        make.top.mas_equalTo(button.mas_bottom).offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(200);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"进入第三个页面" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showThreeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(textfield.mas_centerX);
        make.top.mas_equalTo(textfield.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
}

- (void)buttonAction
{
    // 1⃣️回调
    if (self.block) {
        self.block(self.textfield.text);
        [self popView];
    }
}


- (void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showThreeButtonAction:(UIButton *)sender
{
     ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    __weak ThreeViewController *threevc = threeVC;
    __weak SecondViewController *weakSelf = self;
    
    //2⃣️block执行语句
    threeVC.returnBlock = ^(){
        
        weakSelf.textfield.text = threevc.threeTextField.text;
    };
    
    [self.navigationController pushViewController:threeVC animated:YES];
}

// 点击空白收回键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textfield resignFirstResponder];
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
