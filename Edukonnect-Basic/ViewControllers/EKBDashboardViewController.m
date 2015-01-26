//
//  EKBDashboardViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBDashboardViewController.h"

@implementation EKBDashboardViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title = @"";
//    self.title = @"Edukonnect - Basic";
    self.navigationItem.hidesBackButton = YES;
    
    [self.view setBackgroundColor:[UIColor screenBackgroundColor]];
    
    [self.dashboardScrollView setContentSize:CGSizeMake(320, 485)];
    
    self.myChildBtn.layer.cornerRadius = 10.0f;
    [self.myChildBtn setImage:[UIImage imageNamed:@"MyChild"] forState:UIControlStateNormal];
    [self.myChildBtn setTitle:@"" forState:UIControlStateNormal];
    [self.myChildBtn setBackgroundColor:[UIColor clearColor]];
    [self.myChildBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.myChildBtn.layer setBorderWidth:0.8];
    UILabel *myChildTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [myChildTitle setText:@"My Child"];
    [myChildTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [myChildTitle setTextAlignment:NSTextAlignmentCenter];
    [myChildTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.myChildBtn addSubview:myChildTitle];
    
    self.noticeBtn.layer.cornerRadius = 10.0f;
    [self.noticeBtn setImage:[UIImage imageNamed:@"Notice"] forState:UIControlStateNormal];
    [self.noticeBtn setTitle:@"" forState:UIControlStateNormal];
    [self.noticeBtn setBackgroundColor:[UIColor clearColor]];
    [self.noticeBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.noticeBtn.layer setBorderWidth:0.8];
    UILabel *noticeBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [noticeBtnTitle setText:@"Notices"];
    [noticeBtnTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [noticeBtnTitle setTextAlignment:NSTextAlignmentCenter];
    [noticeBtnTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.noticeBtn addSubview:noticeBtnTitle];
    
    self.eventBtn.layer.cornerRadius = 10.0f;
    [self.eventBtn setImage:[UIImage imageNamed:@"Event"] forState:UIControlStateNormal];
    [self.eventBtn setTitle:@"" forState:UIControlStateNormal];
    [self.eventBtn setBackgroundColor:[UIColor clearColor]];
    [self.eventBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.eventBtn.layer setBorderWidth:0.8];
    UILabel *eventBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [eventBtnTitle setText:@"Events"];
    [eventBtnTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [eventBtnTitle setTextAlignment:NSTextAlignmentCenter];
    [eventBtnTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.eventBtn addSubview:eventBtnTitle];
    
    self.resultBtn.layer.cornerRadius = 10.0f;
    [self.resultBtn setImage:[UIImage imageNamed:@"Result"] forState:UIControlStateNormal];
    [self.resultBtn setTitle:@"" forState:UIControlStateNormal];
    [self.resultBtn setBackgroundColor:[UIColor clearColor]];
    [self.resultBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.resultBtn.layer setBorderWidth:0.8];
    UILabel *resultBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [resultBtnTitle setText:@"Results"];
    [resultBtnTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [resultBtnTitle setTextAlignment:NSTextAlignmentCenter];
    [resultBtnTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.resultBtn addSubview:resultBtnTitle];
    
    self.timetableBtn.layer.cornerRadius = 10.0f;
    [self.timetableBtn setImage:[UIImage imageNamed:@"Timetable"] forState:UIControlStateNormal];
    [self.timetableBtn setTitle:@"" forState:UIControlStateNormal];
    [self.timetableBtn setBackgroundColor:[UIColor clearColor]];
    [self.timetableBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.timetableBtn.layer setBorderWidth:0.8];
    UILabel *timetableBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [timetableBtnTitle setText:@"Timetable"];
    [timetableBtnTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [timetableBtnTitle setTextAlignment:NSTextAlignmentCenter];
    [timetableBtnTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.timetableBtn addSubview:timetableBtnTitle];
    
    self.gallaryBtn.layer.cornerRadius = 10.0f;
    [self.gallaryBtn setImage:[UIImage imageNamed:@"Gallery"] forState:UIControlStateNormal];
    [self.gallaryBtn setTitle:@"" forState:UIControlStateNormal];
    [self.gallaryBtn setBackgroundColor:[UIColor clearColor]];
    [self.gallaryBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.gallaryBtn.layer setBorderWidth:0.8];
    UILabel *gallaryBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 130, 30)];
    [gallaryBtnTitle setText:@"Gallery"];
    [gallaryBtnTitle setTextColor:[UIColor dashbordMenuButtonTextColor]];
    [gallaryBtnTitle setTextAlignment:NSTextAlignmentCenter];
    [gallaryBtnTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
    [self.gallaryBtn addSubview:gallaryBtnTitle];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = [NSString stringWithFormat:@"Dashboard"];
}

#pragma mark IBAction Methods

- (IBAction)myChildBtnClicked:(UIButton *)myChildBtn
{
    NSLog(@"My Child button clicked.");
}

- (IBAction)noticeBtnClicked:(UIButton *)noticeBtn
{
    NSLog(@"Notice button clicked.");
}

- (IBAction)eventBtnClicked:(UIButton *)eventBtn
{
    NSLog(@"Event button clicked.");
}

- (IBAction)resultBtnClicked:(UIButton *)resultBtn
{
    NSLog(@"Result button clicked.");
}

- (IBAction)timetableBtnClicked:(UIButton *)timetableBtn
{
    NSLog(@"Timetable button clicked.");
}

- (IBAction)gallaryBtnClicked:(UIButton *)gallaryBtn
{
    NSLog(@"Gallary button clicked.");
}

@end
