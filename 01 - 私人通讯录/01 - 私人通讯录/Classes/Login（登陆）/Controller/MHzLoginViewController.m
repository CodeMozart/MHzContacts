//
//  MHzLoginViewController.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/15/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzLoginViewController.h"
#import "MHzLoginAniView.h"
#import "MBProgressHUD+XMG.h"
#import "MHzContactController.h"

@interface MHzLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet MHzLoginAniView *loginAniView;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *remPwd;
@property (weak, nonatomic) IBOutlet UISwitch *autoLogin;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
/***********************************************************************************************************/
#pragma mark -  <初始化操作>
@implementation MHzLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    // 设置密码区域的代理
    self.pwdField.delegate = self;
    
    // 监听账户和密码区域的变化，一旦开始编辑，就调用控制器的textChange的方法
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}


/***********************************************************************************************************/
#pragma mark -  <UITextField Delegate>

// 一旦文本框开始编辑的时候就会通知代理调用这个方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.loginAniView startAni:YES];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.loginAniView startAni:NO];
}


/***********************************************************************************************************/
#pragma mark -  <界面上的按钮功能>

// 勾选自动登录也会同时勾选上记住密码
- (IBAction)clickAutoLogin:(UISwitch *)sender {
    
    if (sender.on == YES) {
        [_remPwd setOn:YES animated:YES ];
    }
}

// 取消记住密码也会同时取消自动登录
- (IBAction)clickRemPwd:(UISwitch *)sender {
    
    if (sender.on == NO) {
        [_autoLogin setOn:NO animated:YES];
    }
}

// 监听textfiled发生改变后的动作
- (void)textChange
{
    // 如果账号和密码同时有值，登陆按钮就可以点击
    _loginButton.enabled = _pwdField.text.length && _accountField.text.length;
}


// 点击登陆按钮的操作
- (IBAction)clickLogin:(UIButton *)sender {
    
    // 延迟判断，弹出蒙版
    [MBProgressHUD showMessage:@"Loading……"];
    
    // 延迟.5秒后执行的操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 隐藏蒙版
        [MBProgressHUD hideHUD];
        
        // 只有账户和密码正确输入才能跳转
        if ([_accountField.text isEqualToString:@"Minghe"] && [_pwdField.text isEqualToString:@"pinkysue"]) {
            
            // 跳转页面
            [self performSegueWithIdentifier:@"login2Contact" sender:nil];
        }
        else
        {
            // 如果账号密码错误弹出消息
            [MBProgressHUD showError:@"The Account or Password Error"];
        }
        
    });
   
}

/***********************************************************************************************************/
#pragma mark -  <界面之间传递数据>
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MHzContactController *cc = segue.destinationViewController;
    
    cc.contactTitle = _accountField.text;
}



@end
