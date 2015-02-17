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
    
    NSLog(@"self.eventDict ::: %@", self.eventDict);
    
    [self.eventNameLabel setText:[self.eventDict objectForKey:EVENT_API_EVENT_NAME_KEY]];
    
    NSDate *createdDate = [EKBUtility deserializeJsonDateString:[self.eventDict objectForKey:EVENT_API_CREATED_DATE_KEY]];
    [self.eventDateLabel setText:[EKBUtility convertDateToString:createdDate]];
    [self.eventDateLabel setFrame:CGRectMake(10, 70, 155, 40)];
    [self.eventDateLabel setTextAlignment:NSTextAlignmentLeft];
    
    if ([[self.eventDict objectForKey:EVENT_API_TIME_KEY] isEqual:[NSNull null]]) {
        [self.eventTimeLabel setText:@"--"];
        
    } else {
        [self.eventTimeLabel setText:[self.eventDict objectForKey:EVENT_API_TIME_KEY]];
    }
    [self.eventTimeLabel setFrame:CGRectMake(160, 70, 155, 40)];
    [self.eventTimeLabel setTextAlignment:NSTextAlignmentRight];
    
    NSString *imageUrlString = [NSString stringWithFormat:@"http://www.edukonnect.net.in/Images/Event/%@", [self.eventDict objectForKey:EVENT_API_IMAGE_KEY]];
    [self.eventImageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
    [self.eventImageView setFrame:CGRectMake(10, 50, 310, 200)];
    
    CGRect frame = self.eventTimeLabel.frame;
    CGRect frameIV = self.eventImageView.frame;
    [self.eventImageView setFrame:CGRectMake(frameIV.origin.x, frame.origin.y + frame.size.height + 10, frameIV.size.width, frameIV.size.height)];
    
    [self.eventMessageTextView setText:[self.eventDict objectForKey:EVENT_API_VENUE_KEY]];
    
    // Check isGoingControl if NO then disable isGoing option
    BOOL isGoingControl = [[self.eventDict objectForKey:EVENT_API_ISGOING_CONTROL_KEY] boolValue];
    if (!isGoingControl) {
        [self.isGoingButton setEnabled:NO];
        [self.isGoingLabel setEnabled:NO];
    }
    
    // Check isGoing if YES then set button image to selected and disable user interaction.
    NSString *isGoingString = [self.eventDict objectForKey:EVENT_API_ISGOING_KEY];
    
    if (![isGoingString isEqual:[NSNull null]]) { // isGoing Parameter is not null
        if ([isGoingString isEqualToString:@"True"]) {
            [self.isGoingButton setImage:[UIImage imageNamed:@"Checkbox_Selected"] forState:UIControlStateNormal];
            [self.isGoingButton setUserInteractionEnabled:NO];
        }
    }
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Event Details"];
}

#pragma mark IBAction Methods

- (IBAction)isGoingClicked:(UIButton *)senderBtn
{
    NSLog(@"Is going clicked...");
    
    // Check whether isGoing if YES then return;
    BOOL status = [EKBAPICall userGoingToEventForId:[self.eventDict objectForKey:EVENT_API_ID_KEY]];
    if (status) {
        [senderBtn setImage:[UIImage imageNamed:@"Checkbox_Selected"] forState:UIControlStateNormal];
        [senderBtn setUserInteractionEnabled:NO];
    }
}

@end
