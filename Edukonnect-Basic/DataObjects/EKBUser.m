//
//  EKBUser.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBUser.h"

@implementation EKBUser

#pragma mark ObjectLifeCycle

- (id)init
{
    self = [super init];
    
    if (self) {
        self.userName = @"";
        self.password = @"";
        self.stdList = [[NSArray alloc] init];
        self.userAddress = @"";
        self.userEmail = @"";
        self.userMobile = @"";
        self.userIsMobileConfirm = NO;
        self.userNameString = @"";
        self.userRelation = @"";
        self.userId = @"";
        self.userPinCode = @"";
        self.userVcrcity = @"";
        self.userVcrstate = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.password = [decoder decodeObjectForKey:@"password"];
        self.stdList = [decoder decodeObjectForKey:@"stdList"];
        self.userAddress = [decoder decodeObjectForKey:@"userAddress"];
        self.userEmail = [decoder decodeObjectForKey:@"userEmail"];
        self.userMobile = [decoder decodeObjectForKey:@"userMobile"];
        self.userIsMobileConfirm = [decoder decodeIntegerForKey:@"userIsMobileConfirm"];
        self.userNameString = [decoder decodeObjectForKey:@"userNameString"];
        self.userRelation = [decoder decodeObjectForKey:@"userRelation"];
        self.userId = [decoder decodeObjectForKey:@"userId"];
        self.userPinCode = [decoder decodeObjectForKey:@"userPinCode"];
        self.userVcrcity = [decoder decodeObjectForKey:@"userVcrcity"];
        self.userVcrstate = [decoder decodeObjectForKey:@"userVcrstate"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.stdList forKey:@"stdList"];
    [encoder encodeObject:self.userAddress forKey:@"userAddress"];
    [encoder encodeObject:self.userEmail forKey:@"userEmail"];
    [encoder encodeObject:self.userMobile forKey:@"userMobile"];
    [encoder encodeInteger:self.userIsMobileConfirm forKey:@"userIsMobileConfirm"];
    [encoder encodeObject:self.userNameString forKey:@"userNameString"];
    [encoder encodeObject:self.userRelation forKey:@"userRelation"];
    [encoder encodeObject:self.userId forKey:@"userId"];
    [encoder encodeObject:self.userPinCode forKey:@"userPinCode"];
    [encoder encodeObject:self.userVcrcity forKey:@"userVcrcity"];
    [encoder encodeObject:self.userVcrstate forKey:@"userVcrstate"];
}

@end
