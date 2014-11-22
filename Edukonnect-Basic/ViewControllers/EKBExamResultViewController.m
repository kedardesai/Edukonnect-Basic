//
//  EKBExamResultViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBExamResultViewController.h"

@interface EKBExamResultViewController ()

@property (nonatomic, strong) NSMutableArray *resultListArray;

@end

@implementation EKBExamResultViewController

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
    
    self.resultListArray = [[NSMutableArray alloc] init];
    NSNumber *examId = (NSNumber *) [self.examDict objectForKey:EXAM_API_ID_KEY];
    self.resultListArray = [EKBAPICall getResultForExamID:examId];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = [NSString stringWithFormat:@"Result-%@",[self.examDict objectForKey:EXAM_API_NAME_KEY]];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"ExamResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableDictionary *resultDict = [[self.resultListArray objectAtIndex:indexPath.row] mutableCopy];
    
    UILabel *subjectLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [subjectLabel setText:[resultDict objectForKey:RESULT_API_SUBJECT_KEY]];
    
    UILabel *markLabel = (UILabel *) [cell.contentView viewWithTag:101];
    [markLabel setText:[resultDict objectForKey:RESULT_API_MARK_KEY]];
    
    UILabel *outOfLabel = (UILabel *) [cell.contentView viewWithTag:102];
    [outOfLabel setText:[resultDict objectForKey:RESULT_API_OUTOF_KEY]];
    
    UILabel *attendanceLabel = (UILabel *) [cell.contentView viewWithTag:103];
    [attendanceLabel setText:[resultDict objectForKey:RESULT_API_ATTENDANCE_KEY]];
    
    UITextView *commentTextView = (UITextView *) [cell.contentView viewWithTag:104];
    [commentTextView setText:[resultDict objectForKey:RESULT_API_COMMENT_KEY]];
    
    return cell;
}

@end
