//
//  EKBConstants.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBConstants.h"

@implementation EKBConstants

NSString *LOGGED_USER = @"LoggedUser";
NSString *DEVICE_ID = @"DeviceID";
NSString *CURRENT_STUDENT = @"CurrentStudent";

NSString *ADDRESS_FIELD_PLACEHOLDER = @"Enter Address";

NSString *LOGIN_URL = @"http://4parents.mobi/account/signin.aspx?";
NSString *FORGOT_PASSWORD_URL = @"http://4parents.mobi/account/Forgotpassword.aspx";
NSString *NEW_USER_URL = @"http://4parents.mobi/account/Registration.aspx";
NSString *WEB_LOGIN_URL = @"http://4parents.mobi/account/Login.aspx";

NSString *STUDENT_DETAILS_URL = @"http://mobi.edukonnect.net.in/RestService.svc/studentDetails?";
NSString *ADD_CHILD_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/AddChild?";
NSString *TIMETABLE_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetTimeTableList?";
NSString *NOTICE_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetNotice?";
NSString *STATE_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetState";
NSString *CITY_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetCity?";
NSString *REGISTRATION_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/Register?";
NSString *EVENT_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetEventList?";
NSString *EXAM_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetExamList?";
NSString *RESULT_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetResult?";
NSString *GALLARY_FOLDER_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetGallaryList?";
NSString *GALLARY_IMAGE_LIST_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/GetGallaryDetails?";
NSString *FORGOT_PWD_API_URL = @"http://mobi.edukonnect.net.in/RestService.svc/ForgotPassword?role=4"; 

NSString *LOGIN_API_STATUS_KEY = @"status";
NSString *LOGIN_API_STDLIST_KEY = @"stdlist";
NSString *LOGIN_API_LOGINRESULT_KEY = @"LoginResult";
NSString *LOGIN_API_USER_DETAILS_KEY = @"p";
NSString *LOGIN_API_ADDRESS_KEY = @"Address";
NSString *LOGIN_API_EMAIL_KEY = @"Email";
NSString *LOGIN_API_ISMOBILECONFIRM_KEY = @"IsMobileConfirm";
NSString *LOGIN_API_MOBILE_KEY = @"Mobile";
NSString *LOGIN_API_NAME_KEY = @"Name";
NSString *LOGIN_API_RELATION_KEY = @"Relation";
NSString *LOGIN_API_ID_KEY = @"id";
NSString *LOGIN_API_PINCODE_KEY = @"pincode";
NSString *LOGIN_API_CITY_KEY = @"vcrcity";
NSString *LOGIN_API_STATE_KEY = @"vcrstate";

NSString *STUDENT_DETAILS_API_RESULT_KEY = @"studentDetailsResult";
NSString *STUDENT_DETAILS_API_DOB_KEY = @"DOB";
NSString *STUDENT_DETAILS_API_DIV_KEY = @"Div";
NSString *STUDENT_DETAILS_API_GRNO_KEY = @"GRno";
NSString *STUDENT_DETAILS_API_MOBILE1_KEY = @"Mobile1";
NSString *STUDENT_DETAILS_API_MOBILE2_KEY = @"Mobile2";
NSString *STUDENT_DETAILS_API_NAME_KEY = @"Name";
NSString *STUDENT_DETAILS_API_ROLL_NO_KEY = @"RollNo";
NSString *STUDENT_DETAILS_API_STANDARD_KEY = @"Standard";
NSString *STUDENT_DETAILS_API_AADHARNO_KEY = @"aadharNo";
NSString *STUDENT_DETAILS_API_ID_KEY = @"id";
NSString *STUDENT_DETAILS_API_SCHOOLID_KEY = @"schoolID";

NSString *ADD_CHILD_API_RESULT_KEY = @"AddChildResult";
NSString *ADD_CHILD_API_MESSAGE_KEY = @"Message";
NSString *ADD_CHILD_API_STATUS_KEY = @"Status";
NSString *ADD_CHILD_API_STUDENT_KEY = @"student";

NSString *TIMETABLE_API_RESULT_KEY = @"GetTimeTableListResult";
NSString *TIMETABLE_API_DIV_KEY = @"Div";
NSString *TIMETABLE_API_NAME_KEY = @"Name";
NSString *TIMETABLE_API_SCHOOLID_KEY = @"SchoolID";
NSString *TIMETABLE_API_ID_KEY = @"id";
NSString *TIMETABLE_API_STD_KEY = @"std";

NSString *NOTICE_API_RESULT_KEY = @"GetNoticeResult";
NSString *NOTICE_API_CREATED_BY_KEY = @"CreatedBy";
NSString *NOTICE_API_CREATED_DATE_KEY = @"CreatedDate";
NSString *NOTICE_API_DIV_ID_KEY = @"DivID";
NSString *NOTICE_API_HEADING_KEY = @"Heading";
NSString *NOTICE_API_ISACTIVE_KEY = @"IsActive";
NSString *NOTICE_API_ISFORSTD_KEY = @"IsForStd";
NSString *NOTICE_API_ISSEEN_KEY = @"Isseen";
NSString *NOTICE_API_MESSAGE_KEY = @"Message";
NSString *NOTICE_API_STUDENTID_KEY = @"StudentID";
NSString *NOTICE_API_ID_KEY = @"id";
NSString *NOTICE_API_SCHOOLID_KEY = @"schoolID";
NSString *NOTICE_API_STDID_KEY = @"standerdid";

NSString *STATE_API_RESULT_KEY = @"GetStateResult";
NSString *STATE_API_ID_KEY = @"id";
NSString *STATE_API_NAME_KEY = @"name";

NSString *CITY_API_RESULT_KEY = @"GetCityResult";
NSString *CITY_API_ID_KEY = @"id";
NSString *CITY_API_NAME_KEY = @"Name";

NSString *REGISTRATION_API_RESULT_KEY = @"RegisterResult";
NSString *REGISTRATION_API_MESSAGE_KEY = @"Message";
NSString *REGISTRATION_API_STATUS_KEY = @"status";

NSString *EVENT_API_RESULT_KEY = @"GetEventListResult";
NSString *EVENT_API_CREATED_BY_KEY = @"CreatedBy";
NSString *EVENT_API_CREATED_DATE_KEY = @"CreatedDate";
NSString *EVENT_API_DATE_KEY = @"Date";
NSString *EVENT_API_EVENT_FOR_KEY = @"EventFor";
NSString *EVENT_API_EVENT_NAME_KEY = @"EventName";
NSString *EVENT_API_IMAGE_KEY = @"Image";
NSString *EVENT_API_STD_KEY = @"Std";
NSString *EVENT_API_TIME_KEY = @"Time";
NSString *EVENT_API_VENUE_KEY = @"Venue";
NSString *EVENT_API_CHILD_ID_KEY = @"childid";
NSString *EVENT_API_ISGOING_KEY = @"isgoing";
NSString *EVENT_API_ISGOING_CONTROL_KEY = @"isgoingcontroltoshow";

NSString *EXAM_API_RESULT_KEY = @"GetExamListResult";
NSString *EXAM_API_NAME_KEY = @"Name";
NSString *EXAM_API_ID_KEY = @"id";

NSString *RESULT_API_RESULT_KEY = @"GetResultResult";
NSString *RESULT_API_COMMENT_KEY = @"Comment";
NSString *RESULT_API_MARK_KEY = @"Mark";
NSString *RESULT_API_ATTENDANCE_KEY = @"attendence";
NSString *RESULT_API_EXAM_KEY = @"exam";
NSString *RESULT_API_ID_KEY = @"id";
NSString *RESULT_API_OUTOF_KEY = @"outof";
NSString *RESULT_API_STUDENT_KEY = @"student";
NSString *RESULT_API_SUBJECT_KEY = @"subject";

NSString *GALLARY_FOLDER_API_RESULT_KEY = @"GetGallaryListResult";
NSString *GALLARY_FOLDER_API_NAME_KEY = @"Name";
NSString *GALLARY_FOLDER_API_GID_KEY = @"id";
NSString *GALLARY_FOLDER_API_SCHOOLID_KEY = @"schoolID";

NSString *GALLARY_IMAGE_API_RESULT_KEY = @"GetGallaryDetailsResult";
NSString *GALLARY_IMAGE_API_GID_KEY = @"GID";
NSString *GALLARY_IMAGE_API_DESC_KEY = @"desc";
NSString *GALLARY_IMAGE_API_ID_KEY = @"id";
NSString *GALLARY_IMAGE_API_IMAGE_KEY = @"imgPath";

NSString *FORGOT_PWD_API_RESULT_KEY = @"ForgotPasswordResult";

@end
