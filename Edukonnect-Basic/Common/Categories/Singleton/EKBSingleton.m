//
//  EKBSingleton.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBSingleton.h"
#import "EKBUser.h"

@implementation EKBSingleton

#pragma mark Save User Data

+ (void)saveUserWithUserName:(NSString *)userName password:(NSString *)password
{
    EKBUser *userObj = [[EKBUser alloc] init];
    userObj.userName = userName;
    userObj.password = password;
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"LoggedUser"];
    [defaults synchronize];
    
}

+ (EKBUser *)loadUserObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"LoggedUser"];
    EKBUser *userObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userObj;
}

@end
