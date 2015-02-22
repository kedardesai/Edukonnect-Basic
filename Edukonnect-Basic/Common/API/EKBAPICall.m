//
//  EKBAPICall.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBAPICall.h"
#import "EKBUtility.h"
#import "EKBSingleton.h"
#import "EKBStudent.h"

@interface EKBAPICall ()

@property (nonatomic) APICallType apiType;

@end

@implementation EKBAPICall

#pragma mark Login-API

+ (NSMutableDictionary *)callLoginAPIWithUserName:(NSString *)userName andPassword:(NSString *)password
{
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"http://mobi.edukonnect.net.in/RestService.svc/login?username=%@&password=%@", userName, password];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        [EKBUtility showAlertViewWithTitle:@"Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

+ (NSMutableDictionary *)checkForBackgroundUpdatesForStudentId:(NSString *)studentId
{
//    EKBUser *user = [EKBSingleton loadUserObject];
    NSString *urlString = [NSString stringWithFormat:@"http://mobi.edukonnect.net.in/RestService.svc/GetNotifications?&studentID=%@", studentId]; //[[user stdList] objectAtIndex:0]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

+ (NSMutableArray *)getStudentDetailsList
{
    EKBUser *userObject = [EKBSingleton loadUserObject];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    NSArray *studentList = userObject.stdList;
    for (NSString *studentId in studentList) {
        NSString *urlString = [NSString stringWithFormat:@"%@studentid=%@", STUDENT_DETAILS_URL, studentId];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [theRequest setHTTPMethod:@"GET"];
        
        NSURLResponse* response;
        NSError* error = nil;
        NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
        
        if (error) {
            NSLog(@"ERROR ::: %@", [error localizedDescription]);
            [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
            return nil;
        }
        
        NSError *localError = nil;
        
        NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
        
        if (localError) {
            NSLog(@"localError ::: %@", [localError localizedDescription]);
            [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
            return nil;
        }
        
        
        NSMutableDictionary *resultDict = [[dictionary objectForKey:STUDENT_DETAILS_API_RESULT_KEY] mutableCopy];
        EKBStudent *student = [[EKBStudent alloc] init];
        student.studentAadharNo = [resultDict objectForKey:STUDENT_DETAILS_API_AADHARNO_KEY];
        student.studentDiv = [resultDict objectForKey:STUDENT_DETAILS_API_DIV_KEY];
        student.studentDOB = [resultDict objectForKey:STUDENT_DETAILS_API_DOB_KEY];
        student.studentGRNo = [resultDict objectForKey:STUDENT_DETAILS_API_GRNO_KEY];
        student.studentId = [resultDict objectForKey:STUDENT_DETAILS_API_ID_KEY];
        student.studentMobile1 = [resultDict objectForKey:STUDENT_DETAILS_API_MOBILE1_KEY];
        student.studentMobile2 = [resultDict objectForKey:STUDENT_DETAILS_API_MOBILE2_KEY];
        student.studentName = [resultDict objectForKey:STUDENT_DETAILS_API_NAME_KEY];
        student.studentRollNo = [resultDict objectForKey:STUDENT_DETAILS_API_ROLL_NO_KEY];
        student.studentSchoolId = [resultDict objectForKey:STUDENT_DETAILS_API_SCHOOLID_KEY];
        student.studentStd = [resultDict objectForKey:STUDENT_DETAILS_API_STANDARD_KEY];
        [resultArray addObject:student];
    }
    
    return resultArray;
}

+ (NSDictionary *)getStudentDetailsForStudentId:(NSString *)studentId
{
    NSString *urlString = [NSString stringWithFormat:@"%@studentid=%@", STUDENT_DETAILS_URL, studentId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

+ (NSMutableDictionary *)addNewChildToParentWithDOB:(NSString *)dobString grNo:(NSString *)grNoString schoolCode:(NSString *)schoolCode andParentId:(NSString *)parentid
{
    NSString *urlString = [NSString stringWithFormat:@"%@dob=%@&grno=%@&schoolcode=%@&parentid=%@", ADD_CHILD_API_URL, dobString, grNoString, schoolCode, parentid];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

+ (NSDictionary *)getTimeTableForDiv:(NSString *)div andStd:(NSString *)std
{
    NSString *urlString = [NSString stringWithFormat:@"%@std=%@&Div=%@", TIMETABLE_API_URL, std, div];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

+ (NSMutableArray *)getNoticeList
{
//    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@studentID=%@", NOTICE_LIST_API_URL, currentStudent.studentId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:NOTICE_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getListOfStates
{
    NSString *urlString = [NSString stringWithFormat:@"%@", STATE_LIST_API_URL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:STATE_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getListOfCitiesForState:(NSNumber *)stateId
{
    NSString *urlString = [NSString stringWithFormat:@"%@state=%@", CITY_LIST_API_URL, stateId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:CITY_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableDictionary *)registerNewUser:(EKBUser *)userObj
{
    NSString *urlString = [NSString stringWithFormat:@"%@Name=%@&address=%@&Email=%@&PhoneNo=%@&state=%@&city=%@&Pincode=%@&Password=%@", REGISTRATION_API_URL, userObj.userName, userObj.userAddress, userObj.userEmail, userObj.userMobile, userObj.userVcrstate, userObj.userVcrcity, userObj.userPinCode, userObj.password];
    NSLog(@"urlString ::: %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableDictionary *responseDictionary = [[dictionary objectForKey:REGISTRATION_API_RESULT_KEY] mutableCopy];
    
    return responseDictionary;
}

+ (NSMutableArray *)getEventList
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@std=%@", EVENT_LIST_API_URL, currentStudent.studentStd];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:EVENT_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getExamList
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@schoolID=%@&studentID=%@", EXAM_LIST_API_URL, currentStudent.studentSchoolId, currentStudent.studentId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:EXAM_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getResultForExamID:(NSNumber *)examId
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@schoolID=%@&ExamID=%@&studentID=%@", RESULT_LIST_API_URL, currentStudent.studentSchoolId, examId, currentStudent.studentId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:RESULT_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getGallaryFolders
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@schoolID=%@", GALLARY_FOLDER_LIST_API_URL, currentStudent.studentSchoolId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:GALLARY_FOLDER_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (NSMutableArray *)getGallaryForGallaryId:(NSNumber *)gallaryId
{
//    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    NSString *urlString = [NSString stringWithFormat:@"%@GallaryID=%@", GALLARY_IMAGE_LIST_API_URL, gallaryId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *resultArray = [[dictionary objectForKey:GALLARY_IMAGE_API_RESULT_KEY] mutableCopy];
    return resultArray;
}

+ (BOOL)forgotPasswordWithEmailId:(NSString *)email
{
    NSString *urlString = [NSString stringWithFormat:@"%@&email=%@", FORGOT_PWD_API_URL, email];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return NO;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return NO;
    }
    
    BOOL status = [[dictionary objectForKey:FORGOT_PWD_API_RESULT_KEY] boolValue];
    return status;
}

+ (BOOL)userGoingToEventForId:(NSString *)eventId
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    NSString *studentId = currentStudent.studentId;
    NSString *urlString = [NSString stringWithFormat:@"%@eventid=%@&studentid=%@", IS_GOING_EVENT, eventId, studentId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return NO;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return NO;
    }
    
    BOOL status = [[dictionary objectForKey:IS_GOING_API_RESULT_KEY] boolValue];
    return status;
}

+ (BOOL)seenNoticeNoticeId:(NSString *)noticeId
{
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    NSString *studentId = currentStudent.studentId;
    NSString *urlString = [NSString stringWithFormat:@"%@NoticeID=%@", NOTICE_SEEN_URL_API, noticeId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return NO;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        NSLog(@"localError ::: %@", [localError localizedDescription]);
        [EKBUtility showAlertViewWithTitle:@"Network Error" andMessage:[localError localizedDescription]];
        return NO;
    }
    
    BOOL status = [[dictionary objectForKey:IS_GOING_API_RESULT_KEY] boolValue];
    return status;
}


@end
