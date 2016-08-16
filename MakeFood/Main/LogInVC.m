//
//  LogInRegistVC.m
//  MakeFood
//
//  Created by foscom on 16/8/16.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "LogInVC.h"
#import "LoginFootView.h"

@interface LogInVC ()
@property(nonatomic,strong)UITextField *useNameTF;
@property(nonatomic,strong)UITextField *passWordTF;
@property(nonatomic,strong)UIButton *loginBtn;

@end

@implementation LogInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    [self makeLeftAndRight];
    [self.view addSubview:self.useNameTF];
    [self.view addSubview:self.passWordTF];
    [self.view addSubview:self.loginBtn];
    [self makeFootView];
    [self.useNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.view.mas_top).with.offset(120);
        
    }];
    
    [self.passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.useNameTF.mas_bottom).with.offset(20);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.top.equalTo(self.passWordTF.mas_bottom).with.offset(20);
        make.height.mas_equalTo(50);
    }];
    
    
    
    
}


- (void)makeFootView
{
    
    LoginFootView *foot = [[LoginFootView alloc] init];
    
    foot.btnBlock = ^(UIButton *btn){
        NSLog(@"btn.tag = %ld",(long)btn.tag);
        
    };
    [self.view addSubview:foot];
    
    [foot mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(150);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
        
    }];
    
    
}
- (void)makeLeftAndRight
{

    UIButton *btn= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"ic_detail_delete.png"] forState:UIControlStateNormal];
    [btn addTartgetBlock:^(UIButton *obj) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIBarButtonItem *leftbtn =[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftbtn;
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn2 setTitle:@"注册" forState:UIControlStateNormal];
    [btn2 setTitleColor:BaseBackgroundColor forState:UIControlStateNormal];
    [btn2 addTartgetBlock:^(UIButton *obj) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIBarButtonItem *rightbtn =[[UIBarButtonItem alloc] initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItem = rightbtn;
    
}


- (UITextField*)useNameTF
{
    if (_useNameTF == nil) {
        _useNameTF = [[UITextField alloc] init];
        _useNameTF.placeholder = @"手机号/邮箱";
        _useNameTF.borderStyle = UITextBorderStyleRoundedRect;
        [_useNameTF setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    }
    return _useNameTF;
}

- (UITextField*)passWordTF
{
    if (_passWordTF == nil) {
        _passWordTF = [[UITextField alloc] init];
        _passWordTF.placeholder = @"密码";
        _passWordTF.borderStyle = UITextBorderStyleRoundedRect;
        [_passWordTF setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];


    }
    return _passWordTF;
}

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.backgroundColor = BaseBackgroundColor;
    }
    
    return _loginBtn;
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
