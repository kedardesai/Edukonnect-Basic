//
//  EKBMainViewController.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    kAfterLoggedInContent,
    kForgotPasswordContent,
    kNewUserContent
    
} WebViewContentType;

@interface EKBMainViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *mainWebView;

@property (nonatomic) WebViewContentType contentType;

@end
