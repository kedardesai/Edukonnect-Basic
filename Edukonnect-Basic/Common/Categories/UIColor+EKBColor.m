//
//  UIColor+EKBColor.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 08/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "UIColor+EKBColor.h"

@implementation UIColor (EKBColor)

#pragma mark KDTextField Border Color

+ (UIColor *)KDTextFieldNormalBorderColor
{
    return [UIColor colorWithRed:51.0f/255.0f green:153.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
}

+ (UIColor *)KDTextFieldErrorBorderColor
{
    return [UIColor colorWithRed:204.0f/255.0f green:0.0/255.0f blue:0.0f/255.0f alpha:1.0f];
}

#pragma mark KDTextField Text Color

+ (UIColor *)KDTextFieldTextColor
{
    return [UIColor colorWithRed:96.0f/255.0f green:96.0f/255.0f blue:96.0f/255.0f alpha:1.0f];
}

#pragma mark Button Background Color

+ (UIColor *)ButtonBackgroundColor
{
    return [UIColor colorWithRed:51.0f/255.0f green:153.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
}

#pragma mark Login-Screen Background Color

+ (UIColor *)screenBackgroundColor
{
    return [UIColor colorWithRed:229.0f/255.0f green:232.0f/255.0f blue:238.0f/255.0f alpha:1.0f];
}

#pragma mark Placeholder Color

+ (UIColor *)placeHolderColor
{
    return [UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
}

@end
