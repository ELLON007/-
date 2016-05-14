//
//  ViewController.m
//  页面跳转
//
//  Created by 李佳骏 on 15/9/14.
//  Copyright (c) 2015年 李佳骏. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setView];
}

- (void)setView{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"进入第二个页面" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor blueColor];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
        make.top.mas_equalTo(100);
    }];
    
    UILabel *label = [UILabel new];
    self.label = label;
    [label setText:@""];
    [label setTextColor:[UIColor blueColor]];
    [label setFont:[UIFont systemFontOfSize:20.]];
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button);
        make.top.mas_equalTo(button.mas_bottom).offset(20);
        make.size.mas_equalTo(button);
    }];
    UILabel *lab = [UILabel new];
    [lab setTextColor:[UIColor whiteColor]];
    [lab setFont:[UIFont systemFontOfSize:20.]];
    [lab setBackgroundColor:[UIColor redColor]];
    [lab setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:lab];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button);
        make.top.mas_equalTo(label.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
}

- (void)buttonAction
{
    
    SecondViewController *second = [SecondViewController new];
    __weak ViewController *weakself = self;
    // 1⃣️block 执行语句
    second.block = ^(NSString *str){
        weakself.label.text = str;
    };
    [self.navigationController pushViewController:second animated:YES];

   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
