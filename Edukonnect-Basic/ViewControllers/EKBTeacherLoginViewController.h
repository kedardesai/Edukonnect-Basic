//
//  EKBTeacherLoginViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 2/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBTeacherLoginViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *urlString;

@end
