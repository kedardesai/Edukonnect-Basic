//
//  EKBUtility.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 10/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBUtility.h"

@implementation EKBUtility

+ (UIView *)screenTitleView
{
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [imageView setImage:[UIImage imageNamed:@"HeaderLogo"]];
//    [titleView addSubview:imageView];
    return imageView;
}

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)msg withDelegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (NSDate *)deserializeJsonDateString: (NSString *)jsonDateString
{
    NSInteger offset = [[NSTimeZone defaultTimeZone] secondsFromGMT]; //get number of seconds to add or subtract according to the client default time zone
    
    NSInteger startPosition = [jsonDateString rangeOfString:@"("].location + 1; //start of the date value
    
    NSTimeInterval unixTime = [[jsonDateString substringWithRange:NSMakeRange(startPosition, 13)] doubleValue] / 1000; //WCF will send 13 digit-long value for the time interval since 1970 (millisecond precision) whereas iOS works with 10 digit-long values (second precision), hence the divide by 1000
    
    NSDate *date = [[NSDate dateWithTimeIntervalSince1970:unixTime] dateByAddingTimeInterval:offset];
    
    return date;
}

+ (NSString *)convertDateToString:(NSDate *)sampleDate
{
    NSDate *selectedDate = sampleDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy/MM/dd"];
    NSString *stringFromDate = [formatter stringFromDate:selectedDate];
    
    return stringFromDate;
}

@end
