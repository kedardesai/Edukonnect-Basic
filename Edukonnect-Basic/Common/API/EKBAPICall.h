//
//  EKBAPICall.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKBUser.h"

typedef enum {
    
    kLoginAPICall,
    kForgotPasswordAPICall,
    kNewUserAPICall
    
} APICallType;

@interface EKBAPICall : NSObject <NSURLConnectionDataDelegate>

+ (NSMutableDictionary *)callLoginAPIWithUserName:(NSString *)userName andPassword:(NSString *)password;

+ (NSMutableDictionary *)checkForBackgroundUpdatesForStudentId:(NSString *)studentId;

+ (NSMutableArray *)getStudentDetailsList;

+ (NSDictionary *)getStudentDetailsForStudentId:(NSString *)studentId;

+ (NSMutableDictionary *)addNewChildToParentWithDOB:(NSString *)dobString grNo:(NSString *)grNoString schoolCode:(NSString *)schoolCode andParentId:(NSString *)parentid;

+ (NSDictionary *)getTimeTableForDiv:(NSString *)div andStd:(NSString *)std;


+ (NSMutableArray *)getNoticeList;

+ (NSMutableArray *)getListOfStates;

+ (NSMutableArray *)getListOfCitiesForState:(NSNumber *)stateId;

+ (NSMutableDictionary *)registerNewUser:(EKBUser *)userObj;

+ (NSMutableArray *)getEventList;

+ (NSMutableArray *)getExamList;

+ (NSMutableArray *)getResultForExamID:(NSNumber *)examId;

+ (NSMutableArray *)getGallaryFolders;

+ (NSMutableArray *)getGallaryForGallaryId:(NSNumber *)gallaryId;

+ (BOOL)forgotPasswordWithEmailId:(NSString *)email;

+ (BOOL)userGoingToEventForId:(NSString *)eventId;

//+ (NSMutableDictionary *)callRegisterWith;

@end
