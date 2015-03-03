//
//  EKBConstants.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKBConstants : NSObject

FOUNDATION_EXPORT NSString *LOGGED_USER;
FOUNDATION_EXPORT NSString *DEVICE_ID;
FOUNDATION_EXPORT NSString *CURRENT_STUDENT;

FOUNDATION_EXPORT NSString *ADDRESS_FIELD_PLACEHOLDER;

FOUNDATION_EXPORT NSString *LOGIN_URL;
FOUNDATION_EXPORT NSString *FORGOT_PASSWORD_URL;
FOUNDATION_EXPORT NSString *NEW_USER_URL;
FOUNDATION_EXPORT NSString *WEB_LOGIN_URL;

FOUNDATION_EXPORT NSString *STUDENT_DETAILS_URL;
FOUNDATION_EXPORT NSString *ADD_CHILD_API_URL;
FOUNDATION_EXPORT NSString *TIMETABLE_API_URL;
FOUNDATION_EXPORT NSString *NOTICE_LIST_API_URL;
FOUNDATION_EXPORT NSString *STATE_LIST_API_URL;
FOUNDATION_EXPORT NSString *CITY_LIST_API_URL;
FOUNDATION_EXPORT NSString *REGISTRATION_API_URL;
FOUNDATION_EXPORT NSString *EVENT_LIST_API_URL;
FOUNDATION_EXPORT NSString *EXAM_LIST_API_URL;
FOUNDATION_EXPORT NSString *RESULT_LIST_API_URL;
FOUNDATION_EXPORT NSString *GALLARY_FOLDER_LIST_API_URL;
FOUNDATION_EXPORT NSString *GALLARY_IMAGE_LIST_API_URL;
FOUNDATION_EXPORT NSString *FORGOT_PWD_API_URL;
FOUNDATION_EXPORT NSString *TIMETABLE_IMAGE_URL;
FOUNDATION_EXPORT NSString *IS_GOING_EVENT;
FOUNDATION_EXPORT NSString *NOTICE_SEEN_URL_API;

FOUNDATION_EXPORT NSString *LOGIN_API_STATUS_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_STDLIST_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_LOGINRESULT_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_USER_DETAILS_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_ADDRESS_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_EMAIL_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_ISMOBILECONFIRM_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_MOBILE_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_NAME_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_RELATION_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_ID_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_PINCODE_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_CITY_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_STATE_KEY;
FOUNDATION_EXPORT NSString *LOGIN_API_TYPE_KEY;

FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_DOB_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_DIV_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_GRNO_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_MOBILE1_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_MOBILE2_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_NAME_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_ROLL_NO_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_STANDARD_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_AADHARNO_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_ID_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_SCHOOLID_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_SCHOOLLOGO_KEY;
FOUNDATION_EXPORT NSString *STUDENT_DETAILS_API_SCHOOLNAME_KEY;

FOUNDATION_EXPORT NSString *ADD_CHILD_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *ADD_CHILD_API_MESSAGE_KEY;
FOUNDATION_EXPORT NSString *ADD_CHILD_API_STATUS_KEY;
FOUNDATION_EXPORT NSString *ADD_CHILD_API_STUDENT_KEY;

FOUNDATION_EXPORT NSString *TIMETABLE_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_DIV_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_NAME_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_SCHOOLID_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_ID_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_STD_KEY;
FOUNDATION_EXPORT NSString *TIMETABLE_API_IMAGEPATH_KEY;

FOUNDATION_EXPORT NSString *NOTICE_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_CREATED_BY_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_CREATED_DATE_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_DIV_ID_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_HEADING_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_ISACTIVE_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_ISFORSTD_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_ISSEEN_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_MESSAGE_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_STUDENTID_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_ID_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_SCHOOLID_KEY;
FOUNDATION_EXPORT NSString *NOTICE_API_STDID_KEY;

FOUNDATION_EXPORT NSString *STATE_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *STATE_API_ID_KEY;
FOUNDATION_EXPORT NSString *STATE_API_NAME_KEY;

FOUNDATION_EXPORT NSString *CITY_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *CITY_API_ID_KEY;
FOUNDATION_EXPORT NSString *CITY_API_NAME_KEY;

FOUNDATION_EXPORT NSString *REGISTRATION_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *REGISTRATION_API_MESSAGE_KEY;
FOUNDATION_EXPORT NSString *REGISTRATION_API_STATUS_KEY;

FOUNDATION_EXPORT NSString *EVENT_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_CREATED_BY_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_CREATED_DATE_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_DATE_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_EVENT_FOR_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_EVENT_NAME_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_IMAGE_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_STD_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_TIME_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_VENUE_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_CHILD_ID_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_ISGOING_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_ID_KEY;
FOUNDATION_EXPORT NSString *EVENT_API_ISGOING_CONTROL_KEY;

FOUNDATION_EXPORT NSString *EXAM_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *EXAM_API_NAME_KEY;
FOUNDATION_EXPORT NSString *EXAM_API_ID_KEY;

FOUNDATION_EXPORT NSString *RESULT_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_COMMENT_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_MARK_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_ATTENDANCE_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_EXAM_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_ID_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_OUTOF_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_STUDENT_KEY;
FOUNDATION_EXPORT NSString *RESULT_API_SUBJECT_KEY;

FOUNDATION_EXPORT NSString *GALLARY_FOLDER_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *GALLARY_FOLDER_API_NAME_KEY;
FOUNDATION_EXPORT NSString *GALLARY_FOLDER_API_GID_KEY;
FOUNDATION_EXPORT NSString *GALLARY_FOLDER_API_SCHOOLID_KEY;


FOUNDATION_EXPORT NSString *GALLARY_IMAGE_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *GALLARY_IMAGE_API_GID_KEY;
FOUNDATION_EXPORT NSString *GALLARY_IMAGE_API_DESC_KEY;
FOUNDATION_EXPORT NSString *GALLARY_IMAGE_API_ID_KEY;
FOUNDATION_EXPORT NSString *GALLARY_IMAGE_API_IMAGE_KEY;

FOUNDATION_EXPORT NSString *FORGOT_PWD_API_RESULT_KEY;
FOUNDATION_EXPORT NSString *IS_GOING_API_RESULT_KEY;

FOUNDATION_EXPORT NSString *NOTIFICATION_ID;

@end
