//
//  EKBUser.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKBUser : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *userAddress;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *userMobile;
@property (nonatomic) BOOL userIsMobileConfirm;
@property (nonatomic, strong) NSString *userNameString;
@property (nonatomic, strong) NSString *userRelation;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userPinCode;
@property (nonatomic, strong) NSString *userVcrcity;
@property (nonatomic, strong) NSString *userVcrstate;
@property (nonatomic, strong) NSArray *stdList;

@end
