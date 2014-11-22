//
//  EKBNoticeDetailsViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBNoticeDetailsViewController.h"

@implementation EKBNoticeDetailsViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    UILabel *headingLabel = (UILabel *)[self.headingView viewWithTag:101];
    [headingLabel setText:[self.noticeDict objectForKey:NOTICE_API_HEADING_KEY]];
    
    UILabel *stdLabel = (UILabel *)[self.headingView viewWithTag:102];
    if (![[self.noticeDict objectForKey:NOTICE_API_STDID_KEY] isEqual:[NSNull null]]) {
        [stdLabel setText:[[self.noticeDict objectForKey:NOTICE_API_STDID_KEY] stringValue]];
    } else {
        [stdLabel setText:@"--"];
    }
    
    UILabel *divLabel = (UILabel *)[self.headingView viewWithTag:103];
    if (![[self.noticeDict objectForKey:NOTICE_API_DIV_ID_KEY] isEqual:[NSNull null]]) {
        [divLabel setText:[[self.noticeDict objectForKey:NOTICE_API_DIV_ID_KEY] stringValue]];
    } else {
        [divLabel setText:@"--"];
    }
    
    UILabel *createdDateLabel = (UILabel *)[self.headingView viewWithTag:105];
    NSDate *createdDate = [EKBUtility deserializeJsonDateString:[self.noticeDict objectForKey:NOTICE_API_CREATED_DATE_KEY]];
    [createdDateLabel setText:[EKBUtility convertDateToString:createdDate]];
    
    [self.messageTextView setText:[self.noticeDict objectForKey:NOTICE_API_MESSAGE_KEY]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Read Notice"];
}

@end
