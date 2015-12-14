//
//  MHzEditController.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzEditController.h"

@interface MHzEditController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *telField;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation MHzEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameField.enabled = NO;
    _telField.enabled = NO;
    
    _nameField.text = _contact.name;
    _telField.text = _contact.tel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***********************************************************************************************************/
#pragma mark -  <按钮功能>
- (IBAction)clickEdit:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"Edit"]) {
        
        sender.title = @"Cancel";
        
        self.saveButton.hidden = NO;
        
        _nameField.enabled = YES;
        _telField.enabled = YES;
        
        [_telField becomeFirstResponder];
    }
    else
    {
        sender.title = @"Edit";
        
        self.saveButton.hidden = YES;
        
        _nameField.enabled = NO;
        _telField.enabled = NO;
        
        _nameField.text = _contact.name;
        _telField.text = _contact.tel;
        
    }
    
}

- (IBAction)clickSave:(UIButton *)sender {
    
    // 修改模型数据
    _contact.name = _nameField.text;
    _contact.tel = _telField.text;
    
    // 发出通知，刷新联系人列表
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateContact" object:nil];
    
    // 返回上一个控制器（联系人列表界面）
    [self.navigationController popViewControllerAnimated:YES];
    
}







@end
