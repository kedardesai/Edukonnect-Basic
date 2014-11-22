//
//  EKBSingleton.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKBSingleton : NSObject

+ (void)saveUserWithUserName:(NSString *)userName password:(NSString *)password;
+ (EKBUser *)loadUserObject;


@end
