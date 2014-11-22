//
//  EKBNewChildViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBNewChildViewController.h"
#import "EKBUser.h"

@interface EKBNewChildViewController ()

@property (nonatomic, strong) UIDatePicker *dobPickerView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIToolbar *toolBar;

- (void)addNewChild:(UIButton *)submitBtn;
- (void)createPickerView;
- (void)dismissActionSheet:(id)sender;

@end

@implementation EKBNewChildViewController

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
    
    [self.tableView setBackgroundView:nil];
    [self.tableView setBackgroundColor:[UIColor screenBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Add New Child"];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows;
    
    switch (section) {
        case 0:
            numberOfRows = 3;
            break;
            
        default:
            numberOfRows = 1;
            break;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                reuseIdentifier = @"NewChildDOBCell";
                break;
                
            case 1:
                reuseIdentifier = @"NewChildGRNOCell";
                break;
                
            case 2:
                reuseIdentifier = @"NewChildSchoolCodeCell";
                break;
                
            default:
                break;
        }
    } else {
        reuseIdentifier = @"NewChildSubmitCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            KDTextField *GRNoTextField = (KDTextField *)[cell.contentView viewWithTag:101];
            [GRNoTextField setTextFieldtype:kTextFieldTypeString];
            GRNoTextField.delegate = self;
            [GRNoTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:199.0f/255.0f green:199.0f/255.0f blue:199.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:199.0f/255.0f green:199.0f/255.0f blue:199.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
        } else if (indexPath.row == 2) {
            KDTextField *schoolCodeTextField = (KDTextField *)[cell.contentView viewWithTag:101];
            [schoolCodeTextField setTextFieldtype:kTextFieldTypeString];
            schoolCodeTextField.delegate = self;
            [schoolCodeTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:199.0f/255.0f green:199.0f/255.0f blue:199.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:199.0f/255.0f green:199.0f/255.0f blue:199.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
        }
    } else {
        UIButton *submitButton = (UIButton *)[cell.contentView viewWithTag:100];
        submitButton.layer.cornerRadius = 2.0f;
        [submitButton addTarget:self action:@selector(addNewChild:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) { // For DOB
            [self createPickerView];
        }
    }
}

#pragma mark IBAction Methods

- (void)addNewChild:(UIButton *)submitBtn
{
    // Validate Input
    BOOL isValid = YES;
    NSString *dobString, *grNoString, *schoolCodeString;
    for (NSInteger row=0; row<[self.tableView numberOfRowsInSection:0]; row++) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
        if (row == 0) { // For DOB
            UILabel *label = (UILabel *) [cell.contentView viewWithTag:101];
            if (![[label.text componentsSeparatedByString:@"/"] count] == 3) {
                isValid = NO;
            } else {
                dobString = label.text;
            }
        } else if(row == 1) { // For GRNo
            KDTextField *textField = (KDTextField *) [cell.contentView viewWithTag:101];
//            [textField validateTextFieldAnimated:NO];
            if ([[textField text] length]==0) {
                isValid = NO;
            } else {
                grNoString = textField.text;
            }
            
        } else if(row == 2) { // For School Code
            KDTextField *textField = (KDTextField *) [cell.contentView viewWithTag:101];
//            [textField validateTextFieldAnimated:NO];
            if ([[textField text] length]==0) {
                isValid = NO;
            } else {
                schoolCodeString = textField.text;
            }
            
        }
    }
    
    if (isValid) {
        // Call API
        EKBUser *userObject = [EKBSingleton loadUserObject];
        
        NSMutableDictionary *dictionary = [[EKBAPICall addNewChildToParentWithDOB:dobString grNo:grNoString schoolCode:schoolCodeString andParentId:userObject.userName] mutableCopy];
        NSMutableDictionary *resultDict = [dictionary objectForKey:ADD_CHILD_API_RESULT_KEY];
        BOOL isAdded = (BOOL) [resultDict objectForKey:ADD_CHILD_API_STATUS_KEY];
        if (!isAdded) {
            [EKBUtility showAlertViewWithTitle:@"ADD CHILD FAILED" andMessage:[resultDict objectForKey:ADD_CHILD_API_MESSAGE_KEY]];
        } else {
            [EKBUtility showAlertViewWithTitle:@"ADD CHILD SUCCESS" andMessage:@"New Child added successfully."];
        }
    } else {
        [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:@"Please enter valid inputs."];
    }
}


#pragma mark KDTextFieldDelegte Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
}

- (void)onSucess:(KDTextField *)textField
{
}

- (void)doneWithNumberPad:(KDTextField *)textField
{
    [textField setTextColor:[UIColor colorWithRed:199.0f/255.0f green:199.0f/255.0f blue:199.0f/255.0f alpha:1.0]];
}

#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark Code-Reusable Methods

- (void)createPickerView
{
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 344, self.view.bounds.size.width, 344)];
    [self.maskView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.maskView];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 344, self.view.bounds.size.width, 44)];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissActionSheet:)];
    self.toolBar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], done];
    self.toolBar.barStyle = UIBarStyleBlackOpaque;
    [self.view addSubview:self.toolBar];
    
    //(0, self.view.bounds.size.height - 300, 0, 0) // (0, 40, 320, 216)
    self.dobPickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 300, 0, 0)];
    self.dobPickerView.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.dobPickerView];
}

- (void)dismissActionSheet:(id)sender
{
    NSString *stringFromDate = [EKBUtility convertDateToString:[self.dobPickerView date]];
    
    UITableViewCell *dobCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    UILabel *dobLabel = (UILabel *) [dobCell.contentView viewWithTag:101];
    [dobLabel setText:stringFromDate];
    
    [self.maskView removeFromSuperview];
    [self.toolBar removeFromSuperview];
    [self.dobPickerView removeFromSuperview];
}

@end
