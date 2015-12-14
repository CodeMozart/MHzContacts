//
//  MHzAddController.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzAddController.h"
#import "MHzContact.h"

@interface MHzAddController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *telField;

@end

@implementation MHzAddController
/***********************************************************************************************************/
#pragma mark -  <初始化操作>

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.addButton.enabled = NO ;
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_telField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/***********************************************************************************************************/
#pragma mark -  <界面上按钮的动作>

- (IBAction)clickAdd:(id)sender {
    
    // 把输入的信息保存到联系人模型里面
    MHzContact *newContact = [MHzContact contactWithName:_nameField.text andTel:_telField.text];
    
    // 通知代理实现代理方法
    [_delegate addController:self didAddContact:newContact];
    
    [self.navigationController popViewControllerAnimated:YES];
}


/***********************************************************************************************************/
#pragma mark -  <监听textfiled的改变>


// 监听textfiled发生改变后的动作
- (void)textChange
{
    // 如果账号和密码同时有值，登陆按钮就可以点击
    _addButton.enabled = _nameField.text.length && _telField.text.length;
}








@end
