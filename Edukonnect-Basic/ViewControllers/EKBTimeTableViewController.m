//
//  EKBTimeTableViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBTimeTableViewController.h"
#import "EKBStudent.h"
#import "UIImageView+AFNetworking.h"

@implementation EKBTimeTableViewController

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
    
    [self.view setBackgroundColor:[UIColor screenBackgroundColor]];
    
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    NSDictionary *responseDict = [EKBAPICall getTimeTableForDiv:currentStudent.studentDiv andStd:currentStudent.studentStd];
    NSLog(@"responseDict : %@", responseDict);
    NSArray *resultArray = [responseDict objectForKey:TIMETABLE_API_RESULT_KEY];
    NSDictionary *resultDict;
    if ([resultArray count]>0) {
        resultDict = [resultArray objectAtIndex:0];
        self.imageName.text = [resultDict objectForKey:TIMETABLE_API_NAME_KEY];
        self.studentDiv.text = [NSString stringWithFormat:@"%@ - %@",[[resultDict objectForKey:TIMETABLE_API_STD_KEY] stringValue], [[resultDict objectForKey:TIMETABLE_API_DIV_KEY] stringValue]];
    } else {
        self.imageName.text = @"";
        self.studentDiv.text = @"";
    }
    
    NSLog(@"ImagePath ::: %@",[NSString stringWithFormat:@"%@%@", TIMETABLE_IMAGE_URL, [resultDict objectForKey:TIMETABLE_API_IMAGEPATH_KEY]]);
    
    NSString *imagePath = [[resultDict objectForKey:TIMETABLE_API_IMAGEPATH_KEY] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSLog(@"ImagePath :: %@", imagePath);
    
    [self.timeTableImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", TIMETABLE_IMAGE_URL, imagePath]]];
    [self.timeTableImageView setContentMode:UIViewContentModeScaleAspectFit];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = [NSString stringWithFormat:@"Timetable"];
}

@end
