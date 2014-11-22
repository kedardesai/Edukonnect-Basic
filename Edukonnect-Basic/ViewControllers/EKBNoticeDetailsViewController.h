//
//  EKBNoticeDetailsViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBNoticeDetailsViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIView *headingView;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;

@property (nonatomic, strong) NSDictionary *noticeDict;

@end
