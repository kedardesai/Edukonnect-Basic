//
//  EKBNoticeListViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBNoticeListViewController.h"
#import "EKBNoticeDetailsViewController.h"

@interface EKBNoticeListViewController ()

@property (nonatomic, strong) NSDictionary *noticeDict;

@end

@implementation EKBNoticeListViewController

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
    UIEdgeInsets inset = UIEdgeInsetsMake(70, 0, 0, 0);
    self.noticeListTableView.contentInset = inset;
    self.noticeListTableView.scrollIndicatorInsets = inset;
    
    [self.noticeListTableView setBackgroundView:nil];
    [self.noticeListTableView setBackgroundColor:[UIColor screenBackgroundColor]];
    [self.noticeListTableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.noticeListArray = [[NSMutableArray alloc] init];
    
    self.noticeListArray = [EKBAPICall getNoticeList];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Notices"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.noticeListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"NoticeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *noticeDictionary = (NSDictionary *)[self.noticeListArray objectAtIndex:indexPath.row];
    
    BOOL isSeen = [[noticeDictionary objectForKey:NOTICE_API_ISSEEN_KEY] boolValue];
    
    UILabel *headingLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [headingLabel setText:[noticeDictionary objectForKey:NOTICE_API_HEADING_KEY]];
    if (!isSeen) {
        [headingLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:19.0f]];
    } else {
        [headingLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:19.0f]];
    }
    
    UILabel *messageLabel = (UILabel *) [cell.contentView viewWithTag:101];
    [messageLabel setText:[noticeDictionary objectForKey:NOTICE_API_MESSAGE_KEY]];
    
    UILabel *dateLabel = (UILabel *) [cell.contentView viewWithTag:102];
    NSDate *createdDate = [EKBUtility deserializeJsonDateString:[noticeDictionary objectForKey:NOTICE_API_CREATED_DATE_KEY]];
    [dateLabel setText:[EKBUtility convertDateToString:createdDate]];
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *noticeDictionary = (NSDictionary *)[self.noticeListArray objectAtIndex:indexPath.row];
    // Make isSeen true
    
    self.noticeDict = noticeDictionary;
    
    [self performSegueWithIdentifier:@"ShowNoticeDetailsSegue" sender:self];
}


#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EKBNoticeDetailsViewController *detailedNoticeViewController = (EKBNoticeDetailsViewController *) segue.destinationViewController;
    detailedNoticeViewController.noticeDict = self.noticeDict;
}

@end
