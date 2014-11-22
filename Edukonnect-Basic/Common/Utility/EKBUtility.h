//
//  EKBUtility.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 10/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKBUtility : NSObject

+ (UIView *)screenTitleView;

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)msg;

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)msg withDelegate:(id<UIAlertViewDelegate>)delegate;

+ (NSDate *)deserializeJsonDateString: (NSString *)jsonDateString;

+ (NSString *)convertDateToString:(NSDate *)sampleDate;

@end
