//
//  EKBExamListViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBExamListViewController.h"
#import "EKBExamResultViewController.h"

@interface EKBExamListViewController ()

@property (nonatomic, strong) NSMutableArray *examListArray;

@end

@implementation EKBExamListViewController

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
    
    self.examListArray = [[NSMutableArray alloc] init];
    self.examListArray = [EKBAPICall getExamList];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Result"];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.examListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reUseIdentifier = @"ExamNameCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *examDict = [self.examListArray objectAtIndex:indexPath.row];
    
    UILabel *examNameLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [examNameLabel setText:[examDict objectForKey:EXAM_API_NAME_KEY]];
    
    return cell;
}

#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowExamResultSegue"]) {
        UITableViewCell *cell = (UITableViewCell *) sender;
        UILabel *examNameLabel = (UILabel *) [cell.contentView viewWithTag:100];
        NSLog(@"examNameLabel : %@",[examNameLabel text]);
        NSIndexPath *indexPath = [self.examListTableView indexPathForCell:cell];
        EKBExamResultViewController *resultViewController = (EKBExamResultViewController *) segue.destinationViewController;
        resultViewController.examDict = [[self.examListArray objectAtIndex:indexPath.row] mutableCopy];
    }
}

@end

