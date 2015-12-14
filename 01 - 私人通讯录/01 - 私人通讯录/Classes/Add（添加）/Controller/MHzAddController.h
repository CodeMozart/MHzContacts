//
//  MHzAddController.h
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHzContactController,MHzContact,MHzAddController;
@protocol MHzAddControllerDelegate <NSObject>

@optional
- (void)addController:(MHzAddController *)addVc didAddContact:(MHzContact *)contact;

@end


@interface MHzAddController : UIViewController

@property (weak, nonatomic) id<MHzAddControllerDelegate> delegate;

@end
