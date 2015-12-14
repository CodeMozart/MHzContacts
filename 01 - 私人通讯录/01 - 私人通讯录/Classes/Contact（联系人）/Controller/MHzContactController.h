//
//  MHzContactController.h
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHzContactController : UITableViewController

/**
 *  保存联系人的数组属性
 */
@property (strong, nonatomic) NSMutableArray *contactArray;

/**
 *  联系人列表的标题
 */
@property (strong, nonatomic) NSString *contactTitle;

@end
