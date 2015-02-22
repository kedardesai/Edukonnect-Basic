//
//  EKBSingleton.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKBUser;
@class EKBStudent;

@interface EKBSingleton : NSObject

+ (void)saveUserWithUserName:(NSString *)userName password:(NSString *)password andStdList:(NSArray *)stdList;
+ (void)saveUserObject:(EKBUser *)userObject;
+ (EKBUser *)loadUserObject;
+ (void)removeUserObject;

+ (void)saveCurrentStudent:(EKBStudent *)studentObject;
+ (EKBStudent *)loadCurrentStudent;
+ (void)removeCurrentStudent;

@end
