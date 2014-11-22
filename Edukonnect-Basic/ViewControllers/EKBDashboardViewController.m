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
    self.noticeBtn.layer.cornerRadius = 10.0f;
    self.eventBtn.layer.cornerRadius = 10.0f;
    self.resultBtn.layer.cornerRadius = 10.0f;
    self.timetableBtn.layer.cornerRadius = 10.0f;
    self.gallaryBtn.layer.cornerRadius = 10.0f;
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
