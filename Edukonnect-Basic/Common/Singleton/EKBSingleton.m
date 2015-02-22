//
//  EKBSingleton.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBSingleton.h"
#import "EKBUser.h"
#import "EKBConstants.h"

@implementation EKBSingleton

#pragma mark Save User Data

+ (void)saveUserWithUserName:(NSString *)userName password:(NSString *)password andStdList:(NSArray *)stdList
{
    EKBUser *userObj = [[EKBUser alloc] init];
    userObj.userName = userName;
    userObj.password = password;
    userObj.stdList = stdList;
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:LOGGED_USER];
    [defaults synchronize];
}

+ (void)saveUserObject:(EKBUser *)userObject
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObject];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:LOGGED_USER];
    [defaults synchronize];
}

+ (EKBUser *)loadUserObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:LOGGED_USER];
    EKBUser *userObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userObj;
}

+ (void)removeUserObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:LOGGED_USER];
    [defaults synchronize];
}

+ (void)saveCurrentStudent:(EKBStudent *)studentObject
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:studentObject];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:CURRENT_STUDENT];
    [defaults synchronize];
}

+ (EKBStudent *)loadCurrentStudent
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:CURRENT_STUDENT];
    EKBStudent *studentObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return studentObj;
}

+ (void)removeCurrentStudent
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:CURRENT_STUDENT];
    [defaults synchronize];
}

@end
