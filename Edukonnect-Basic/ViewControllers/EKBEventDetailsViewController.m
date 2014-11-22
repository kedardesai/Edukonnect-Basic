//
//  EKBEventDetailsViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBEventDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation EKBEventDetailsViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.eventDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        self.eventDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.eventNameLabel setText:[self.eventDict objectForKey:EVENT_API_EVENT_NAME_KEY]];
    
    NSDate *createdDate = [EKBUtility deserializeJsonDateString:[self.eventDict objectForKey:EVENT_API_CREATED_DATE_KEY]];
    [self.eventDateLabel setText:[EKBUtility convertDateToString:createdDate]];
    if ([[self.eventDict objectForKey:EVENT_API_TIME_KEY] isEqual:[NSNull null]]) {
        [self.eventTimeLabel setText:@"--"];
        
    } else {
        [self.eventTimeLabel setText:[self.eventDict objectForKey:EVENT_API_TIME_KEY]];
    }
    
    [self.eventMessageTextView setText:[self.eventDict objectForKey:EVENT_API_VENUE_KEY]];
    
    NSString *imageUrlString = [NSString stringWithFormat:@"http://www.edukonnect.net.in/Images/Event/%@", [self.eventDict objectForKey:EVENT_API_IMAGE_KEY]];
    [self.eventImageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Event Details"];
}

@end
