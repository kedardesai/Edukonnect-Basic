//
//  EKBEventListViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBEventListViewController.h"
#import "UIImageView+AFNetworking.h"
#import "EKBEventDetailsViewController.h"

@implementation EKBEventListViewController

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
    
    self.eventsArray = [[NSMutableArray alloc] init];
    
    self.eventsArray = [EKBAPICall getEventList];
    NSLog(@"eventsArray :: %@",self.eventsArray);
    
    [self.eventListTableView setBackgroundView:nil];
    [self.eventListTableView setBackgroundColor:[UIColor screenBackgroundColor]];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Events"];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"EventCell";
    
    UITableViewCell *cell = [self.eventListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *eventDict = [self.eventsArray objectAtIndex:indexPath.row];
    
    NSString *imageUrlString = [NSString stringWithFormat:@"http://www.edukonnect.net.in/Images/Event/%@", [eventDict objectForKey:EVENT_API_IMAGE_KEY]];
    NSLog(@"imageUrlString : %@", imageUrlString);
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    UIImageView *eventImage = (UIImageView *)[cell.contentView viewWithTag:101];
    [eventImage setImageWithURL:imageUrl];
    
    UILabel *eventNameLabel = (UILabel *) [cell.contentView viewWithTag:102];
    [eventNameLabel setText:[eventDict objectForKey:EVENT_API_EVENT_NAME_KEY]];
    
    UILabel *dateLabel = (UILabel *) [cell.contentView viewWithTag:103];
    NSDate *createdDate = [EKBUtility deserializeJsonDateString:[eventDict objectForKey:EVENT_API_CREATED_DATE_KEY]];
    [dateLabel setText:[EKBUtility convertDateToString:createdDate]];
    
    UILabel *timeLabel = (UILabel *) [cell.contentView viewWithTag:104];
    if ([[eventDict objectForKey:EVENT_API_TIME_KEY] isEqual:[NSNull null]]) {
        [timeLabel setText:@"--"];
    } else {
        [timeLabel setText:[eventDict objectForKey:EVENT_API_TIME_KEY]];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedEventDict = [[self.eventsArray objectAtIndex:indexPath.row] mutableCopy];
    [self performSegueWithIdentifier:@"ShowEventDetails" sender:self];
}

#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowEventDetails"]) {
        EKBEventDetailsViewController *eventDetailsVC = (EKBEventDetailsViewController *) segue.destinationViewController;
        eventDetailsVC.eventDict = self.selectedEventDict;
    }
}

@end
