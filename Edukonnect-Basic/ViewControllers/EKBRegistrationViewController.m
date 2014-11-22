//
//  EKBRegistrationViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBRegistrationViewController.h"
#import "EKBUtility.h"


@interface EKBRegistrationViewController ()

@property (nonatomic, strong) NSMutableArray *stateListArray;
@property (nonatomic, strong) NSMutableArray *cityListArray;
@property (nonatomic, strong) NSMutableDictionary *allMyTextsDict;
@property (nonatomic, strong) NSNumber *selectedState;
@property (nonatomic, strong) NSNumber *selectedCity;

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic) PickerViewType pickerViewType;

- (void)createPickerViewWithType:(PickerViewType)type;
- (void)dismissActionSheet:(id)sender;
- (void)commonInit;
- (BOOL)validateInputs;
- (EKBUser *)getUserObjectFromInputs;
- (void)reDrawComponents;
- (void)checkboxBtnClicked:(UIButton *)checkBoxBtn;
- (void)submitBtnClicked:(UIButton *)submitBtn;

@end

@implementation EKBRegistrationViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self commonInit];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-140)];
    [self.scrollView setContentSize:CGSizeMake(320, 640)];
    
    [self.scrollView setBackgroundColor:[UIColor screenBackgroundColor]];
    
    [self reDrawComponents];
    
    self.stateListArray = [[NSMutableArray alloc] initWithArray:[EKBAPICall getListOfStates]];
    
    self.navigationController.navigationBar.topItem.title = @"";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Registration"];
}

#pragma mark Code-Reusable Methods

- (void)commonInit
{
    self.isTermsAgreed = NO;
}

- (BOOL)validateInputs
{
    if (!self.isTermsAgreed) {
        [EKBUtility showAlertViewWithTitle:@"Error" andMessage:@"Please agree to terms and Conditions"];
        return NO;
    }
    
    [self.nameTextField validateTextFieldAnimated:NO];
    if (![self.nameTextField isValid]) {
        return NO;
    }
    
    [self.emailTextField validateTextFieldAnimated:NO];
    if (![self.emailTextField isValid]) {
        return NO;
    }
    
    [self.mobileTextField validateTextFieldAnimated:NO];
    if (![self.mobileTextField isValid]) {
        return NO;
    }
    
    if ([[self.addressTextField text] length]==0) {
        [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:@"Please enter address."];
        return NO;
    }
    
    [self.stateTextField validateTextFieldAnimated:NO];
    if (![self.stateTextField isValid]) {
        return NO;
    }
    
    [self.cityTextField validateTextFieldAnimated:NO];
    if (![self.cityTextField isValid]) {
        return NO;
    }
    
    [self.pinCodeTextField validateTextFieldAnimated:NO];
    if (![self.pinCodeTextField isValid]) {
        return NO;
    }
    
    [self.passwordTextField validateTextFieldAnimated:NO];
    if ((![self.passwordTextField isValid]) && (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text])) {
        return NO;
    }
    
    return YES;
}

- (void)reDrawComponents
{
    UIView *nameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.nameTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.nameTextField.layer.cornerRadius = 2;
    [self.nameTextField setTextFieldtype:kTextFieldTypeString];
    [self.nameTextField setLeftView:nameLeftView];
    [self.nameTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *emailLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.emailTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.emailTextField.layer.cornerRadius = 2;
    [self.emailTextField setTextFieldtype:kTextFieldTypeEmail];
    [self.emailTextField setLeftView:emailLeftView];
    [self.emailTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *mobileLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.mobileTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.mobileTextField.layer.cornerRadius = 2;
    [self.mobileTextField setTextFieldtype:kTextFieldTypeNumber];
    [self.mobileTextField setLeftView:mobileLeftView];
    [self.mobileTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    [self.addressTextField setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:210.0f/255.0f alpha:1.0f]];
    [self.addressTextField setText:ADDRESS_FIELD_PLACEHOLDER];
    self.addressTextField.layer.cornerRadius = 2;
    
    UIView *stateLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.stateTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.stateTextField.layer.cornerRadius = 2;
    [self.stateTextField setTextFieldtype:kTextFieldTypeString];
    [self.stateTextField setLeftView:stateLeftView];
    [self.stateTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *cityLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.cityTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.cityTextField.layer.cornerRadius = 2;
    [self.cityTextField setTextFieldtype:kTextFieldTypeString];
    [self.cityTextField setLeftView:cityLeftView];
    [self.cityTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *pinCodeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.pinCodeTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.pinCodeTextField.layer.cornerRadius = 2;
    [self.pinCodeTextField setTextFieldtype:kTextFieldTypeNumber];
    [self.pinCodeTextField setLeftView:pinCodeLeftView];
    [self.pinCodeTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.passwordTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.passwordTextField.layer.cornerRadius = 2;
    [self.passwordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.passwordTextField setLeftView:passwordLeftView];
    [self.passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *confirmPasswordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 10)];
    [self.confirmPasswordTextField setNormalBorderColor:[UIColor clearColor] errorBorderColor:[UIColor clearColor] normalTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] errorTextColor:[UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f] normalBorderWidth:0.0f errorBorderWidth:0.0f];
    self.confirmPasswordTextField.layer.cornerRadius = 2;
    [self.confirmPasswordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.confirmPasswordTextField setLeftView:confirmPasswordLeftView];
    [self.confirmPasswordTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    self.checkBoxBtn.tag = 100;
    [self.checkBoxBtn addTarget:self action:@selector(checkboxBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.submitBtn.tag = 100;
    self.submitBtn.layer.cornerRadius = 2.0f;
    [self.submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createPickerViewWithType:(PickerViewType)type
{
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 344, self.view.bounds.size.width, 344)];
    [self.maskView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.maskView];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissActionSheet:)];
    self.toolBar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], done];
    self.toolBar.barStyle = UIBarStyleBlackOpaque;
    [self.maskView addSubview:self.toolBar];
    
    //(0, self.view.bounds.size.height - 300, 0, 0) // (0, 40, 320, 216)
    self.pickerViewType = type;
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 60, 0, 0)];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    [self.maskView addSubview:self.pickerView];
}

- (void)dismissActionSheet:(id)sender
{
    if (self.pickerViewType == kPickerViewTypeState) {
        NSDictionary *selectedStateDict = (NSDictionary *) [self.stateListArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
        self.selectedState = [selectedStateDict objectForKey:STATE_API_ID_KEY];
        [self.stateTextField setText:[selectedStateDict objectForKey:STATE_API_NAME_KEY]];
        
    } else {
        NSDictionary *selectedCityDict = (NSDictionary *) [self.cityListArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
        self.selectedCity = [selectedCityDict objectForKey:STATE_API_ID_KEY];
        [self.cityTextField setText:[selectedCityDict objectForKey:CITY_API_NAME_KEY]];
    }
    
    [self.pickerView removeFromSuperview];
    [self.toolBar removeFromSuperview];
    [self.maskView removeFromSuperview];
}

- (EKBUser *)getUserObjectFromInputs
{
    EKBUser *userObject = [[EKBUser alloc] init];
    
    userObject.userName = self.nameTextField.text;
    userObject.userEmail = self.emailTextField.text;
    userObject.userMobile = self.mobileTextField.text;
    userObject.userAddress = self.addressTextField.text;
    userObject.userVcrstate = self.stateTextField.text;
    userObject.userVcrcity = self.cityTextField.text;
    userObject.userPinCode = self.pinCodeTextField.text;
    userObject.password = self.passwordTextField.text;
    
    return userObject;
}


#pragma mark UIPickerViewDelegate Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.pickerViewType == kPickerViewTypeState) {
        return [self.stateListArray count];
    } else {
        self.cityListArray = [EKBAPICall getListOfCitiesForState:self.selectedState];
        return [self.cityListArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.pickerViewType == kPickerViewTypeState) {
        NSDictionary *stateDict = [self.stateListArray objectAtIndex:row];
        return [stateDict objectForKey:STATE_API_NAME_KEY];
        
    } else {
        NSDictionary *cityDict = [self.cityListArray objectAtIndex:row];
        return [cityDict objectForKey:CITY_API_NAME_KEY];
    }
}

#pragma mark UITextViewDelegate Methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:ADDRESS_FIELD_PLACEHOLDER]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = ADDRESS_FIELD_PLACEHOLDER;
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}


#pragma mark UITextField Delegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.stateTextField) { // State
        [textField resignFirstResponder];
        [self createPickerViewWithType:kPickerViewTypeState];
        return NO;
        
    } else if (textField == self.cityTextField) { // City
        [textField resignFirstResponder];
        if ([self.stateTextField.text length]>0) {
            [self createPickerViewWithType:kPickerViewTypeCity];
            
        } else {
            [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:@"Please select State."];
        }
        return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
    [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:[error localizedDescription]];
    [textField becomeFirstResponder];
    [self.scrollView scrollRectToVisible:textField.frame animated:YES];
}

- (void)onSucess:(KDTextField *)textField
{
    NSLog(@"Do nothing");
}

- (void)doneWithNumberPad:(KDTextField *)textField
{
    [textField resignFirstResponder];
}

#pragma mark IBAction Methods

- (void)submitBtnClicked:(UIButton *)submitBtn
{
    NSLog(@"Submit Clicked");
    if (self.isTermsAgreed) {
        BOOL isAllValid = [self validateInputs];
        if (isAllValid) {
            // Call Register API
            EKBUser *userObject = [self getUserObjectFromInputs];
            NSMutableDictionary *resultDict = [[EKBAPICall registerNewUser:userObject] mutableCopy];
            NSLog(@"resultDict : %@",resultDict);
            if ([[resultDict objectForKey:REGISTRATION_API_STATUS_KEY] boolValue]) {
                [EKBUtility showAlertViewWithTitle:nil andMessage:[resultDict objectForKey:REGISTRATION_API_MESSAGE_KEY] withDelegate:self];
                
            } else {
                [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:[resultDict objectForKey:REGISTRATION_API_MESSAGE_KEY]];
            }
            
        }
    } else {
        [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:@"Please agree to terms and conditions."];
    }
}

- (void)checkboxBtnClicked:(UIButton *)checkBoxBtn
{
    NSLog(@"Checkbox Clicked");
    if (self.isTermsAgreed) {
        [checkBoxBtn setImage:[UIImage imageNamed:@"Checkbox"] forState:UIControlStateNormal];
        self.isTermsAgreed = NO;
        
    } else {
        [checkBoxBtn setImage:[UIImage imageNamed:@"Checkbox_Selected"] forState:UIControlStateNormal];
        self.isTermsAgreed = YES;
    }
}


@end
