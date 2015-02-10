//
//  EKBStudentListViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBStudentListViewController.h"
#import "EKBStudent.h"

@interface EKBStudentListViewController ()

- (void)callAPI;

@end

@implementation EKBStudentListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.studentListArray = [[NSMutableArray alloc] init];
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self.studentListTableView setBackgroundView:nil];
    [self.studentListTableView setBackgroundColor:[UIColor screenBackgroundColor]];
//    [self.view setBackgroundColor:[UIColor screenBackgroundColor]];
    [self callAPI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"My Child"];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.studentListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"StudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    EKBStudent *studentObj = [self.studentListArray objectAtIndex:indexPath.row];
    
    UILabel *studentNameLabel = (UILabel *)[cell.contentView viewWithTag:100];
    [studentNameLabel setText:studentObj.studentName];
    
    UILabel *studentDOBValue = (UILabel *)[cell.contentView viewWithTag:102];
    NSLog(@"student : %@", studentObj.studentDOB);
    NSDate *dobDate = [EKBUtility deserializeJsonDateString:studentObj.studentDOB];
    [studentDOBValue setText:[EKBUtility convertDateToString:dobDate]];
    
    EKBStudent *currentStudent = [EKBSingleton loadCurrentStudent];
    
    if ([[NSString stringWithFormat:@"%@",studentObj.studentId] isEqualToString:[NSString stringWithFormat:@"%@",currentStudent.studentId]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (NSInteger row = 0; row<[tableView numberOfRowsInSection:0]; row++) {
        UITableViewCell *cellTemp = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
        cellTemp.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    UITableViewCell *cell = [self.studentListTableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    EKBStudent *studentObj = [self.studentListArray objectAtIndex:indexPath.row];
    [EKBSingleton saveCurrentStudent:studentObj];
}

#pragma mark API-Call Methods

- (void)callAPI
{
    self.studentListArray = [EKBAPICall getStudentDetailsList];
    [self.studentListTableView reloadData];
}

@end
