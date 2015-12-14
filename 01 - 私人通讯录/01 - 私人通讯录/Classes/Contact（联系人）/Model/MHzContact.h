//
//  MHzContact.h
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHzContact : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *tel;

+ (instancetype)contactWithName:(NSString *)name andTel:(NSString *)tel;


@end
