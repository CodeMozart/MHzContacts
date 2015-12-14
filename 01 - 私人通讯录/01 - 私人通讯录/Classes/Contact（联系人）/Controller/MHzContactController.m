//
//  MHzContactController.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzContactController.h"
#import "MHzContact.h"
#import "MHzAddController.h"
#import "MHzEditController.h"

@interface MHzContactController ()<UIActionSheetDelegate,MHzAddControllerDelegate>

@end

@implementation MHzContactController


/***********************************************************************************************************/
#pragma mark -  <根据账户信息设置联系人列表的标题>
- (void)setContactTitle:(NSString *)contactTitle
{
    _contactTitle = contactTitle;
    
    // 设置导航条标题
    self.navigationItem.title = [NSString stringWithFormat:@"%@‘s Contact List",_contactTitle];
}


/***********************************************************************************************************/
#pragma mark -  <初始化操作>

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 接收通知
    [[NSNotificationCenter defaultCenter]addObserverForName:@"updateContact" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        
        // 刷新表格
        [self.tableView reloadData];
        
    }];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/***********************************************************************************************************/
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contactArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    MHzContact *contact = self.contactArray[indexPath.row];
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.tel;
    
    return cell;
}


/***********************************************************************************************************/
#pragma mark -  <懒加载>

- (NSMutableArray *)contactArray
{
    if (_contactArray == nil) {
        _contactArray = [NSMutableArray array];
    }
    return _contactArray;
}


/***********************************************************************************************************/
#pragma mark -  <回传数据>

// 设置当前控制器为MHzAddController的代理
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MHzAddController class]]) {
        
        MHzAddController *addVc = segue.destinationViewController;
        
        addVc.delegate = self;
    }
    else
    {
        // 获取到目标控制器（为了面对面的传递数据）
        MHzEditController *editVC = segue.destinationViewController;
        
        // 获取当前选中的角标
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // 获取当前选中的cell，并把cell的模型赋值给目标控制器
        editVC.contact = self.contactArray[indexPath.row];
    }
}

// 当那边点击添加按钮之后，控制器实现代理方法
- (void)addController:(MHzAddController *)addVc didAddContact:(MHzContact *)contact
{
    // 把联系人模型保存进数组
    [self.contactArray addObject:contact];
    
    // 刷新tableview，让数据显示出来
    [self.tableView reloadData];
}




/***********************************************************************************************************/
#pragma mark -  <界面上的按钮功能>

// 点击注销按钮后执行的操作
- (IBAction)logoutButton:(UIBarButtonItem *)sender {
    
    // 希望注销的时候不要直接退出，而是先弹出窗口询问一下
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure to quit ?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"LogOut" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
    
    
}

#pragma mark -  <UIActionSheetDelegate>
// 点击ActionSheet上的按钮执行的操作
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        // 点击注销，返回上一界面
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/***********************************************************************************************************/



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
