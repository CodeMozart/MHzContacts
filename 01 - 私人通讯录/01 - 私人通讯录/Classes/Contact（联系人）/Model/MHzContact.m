//
//  MHzContact.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzContact.h"

@implementation MHzContact

+ (instancetype)contactWithName:(NSString *)name andTel:(NSString *)tel
{
    MHzContact *contact = [[MHzContact alloc] init];
    
    contact.name = name;
    contact.tel = tel;
    
    return contact;
}

@end
