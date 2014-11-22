//
//  EKBLoginViewController.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 08/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBLoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+EKBColor.h"
#import "EKBMainViewController.h"
#import "EKBAPICall.h"
#import "EKBSingleton.h"
#import "EKBConstants.h"
#import "EKBUtility.h"
#import "EKBUser.h"
#import "EKBStudent.h"

@interface EKBLoginViewController ()

- (void)setLeftViewForTextField;

@end

@implementation EKBLoginViewController

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
    
//    self.title = @"Edukonnect - Basic";
//    [self.navigationController.navigationItem setTitleView:[EKBUtility screenTitleView]];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationItem.hidesBackButton = YES;
    
    [self.view setBackgroundColor:[UIColor screenBackgroundColor]];
    
    self.loginComponentsView.layer.masksToBounds = NO;
    self.loginComponentsView.layer.cornerRadius = 8; // if you like rounded corners
    self.loginComponentsView.layer.shadowOffset = CGSizeMake(5, 10);
    self.loginComponentsView.layer.shadowRadius = 5;
    self.loginComponentsView.layer.shadowOpacity = 0.5;
    self.loginComponentsView.autoresizesSubviews = NO;
    [self.loginComponentsView setBackgroundColor:[UIColor whiteColor]];
    
    self.userNameTextField.layer.cornerRadius = 2;
    [self.userNameTextField setIsAnimated:YES];
    [self.userNameTextField setTextFieldtype:kTextFieldTypeEmail];
    [self.userNameTextField setNormalBorderColor:[UIColor KDTextFieldNormalBorderColor] errorBorderColor:[UIColor KDTextFieldErrorBorderColor] normalTextColor:[UIColor KDTextFieldTextColor] errorTextColor:[UIColor KDTextFieldTextColor] normalBorderWidth:1.0f errorBorderWidth:1.0f];
    
    self.passwordTextField.layer.cornerRadius = 2;
    [self.passwordTextField setIsAnimated:YES];
    [self.passwordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.passwordTextField setNormalBorderColor:[UIColor KDTextFieldNormalBorderColor] errorBorderColor:[UIColor KDTextFieldErrorBorderColor] normalTextColor:[UIColor KDTextFieldTextColor] errorTextColor:[UIColor KDTextFieldTextColor] normalBorderWidth:1.0f errorBorderWidth:1.0f];
    
    [self setLeftViewForTextField];
    
    self.loginButton.layer.cornerRadius = 2.0f;
    self.forgotPasswordButton.layer.cornerRadius = 2.0f;
    self.newUserButton.layer.cornerRadius = 2.0f;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
//    [self showAlertViewWithTitle:@"Error - Invalid Text" andMessage:[error localizedDescription]];
}

- (void)onSucess:(KDTextField *)textField
{
//    [self showAlertViewWithTitle:@"Success" andMessage:textField.text];
}

- (void)addCustomValidation:(KDTextField *)textField
{
    NSLog(@"Add Custom Validation here for password");
}

#pragma mark IBAction Methods

- (IBAction)loginButtonClicked:(UIButton *)loginButton
{
    // To Validate textField's text
    
//    [self performSegueWithIdentifier:@"SuccessfulLoginSegue" sender:self];
}

- (IBAction)forgotPasswordButtonClicked:(UIButton *)forgotPasswordButton
{
//    [self performSegueWithIdentifier:@"ForgotPasswordSegue" sender:self];

}

- (IBAction)newUserButtonClicked:(UIButton *)newUserButton
{
//    [self performSegueWithIdentifier:@"NewUserSegue" sender:self];
}

#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark Code-Reusable Methods

 - (void)setLeftViewForTextField
{
    UIView *usernameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewUsername = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewUsername setContentMode:UIViewContentModeScaleAspectFit];
    [imageViewUsername setImage:[UIImage imageNamed:@"Username"]];
    [usernameLeftView addSubview:imageViewUsername];
    [self.userNameTextField setLeftView:usernameLeftView];
    [self.userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewPassword = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewPassword setImage:[UIImage imageNamed:@"Password"]];
    [imageViewPassword setContentMode:UIViewContentModeScaleAspectFit];
    [passwordLeftView addSubview:imageViewPassword];
    [self.passwordTextField setLeftView:passwordLeftView];
    [self.passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    activityIndicatorView.center = self.view.center;
    [activityIndicatorView startAnimating];
    [self.loginComponentsView addSubview:activityIndicatorView];
    
    
    if ([identifier isEqualToString:@"SuccessfulLoginSegue"]) {
        [self.userNameTextField validateTextFieldAnimated:YES];
        [self.passwordTextField validateTextFieldAnimated:YES];
        if (self.userNameTextField.isValid && self.passwordTextField.isValid) {
            // Call Login API
            // Save Data in Singleton
            NSMutableDictionary *responseDict = [EKBAPICall callLoginAPIWithUserName:[self.userNameTextField text] andPassword:[self.passwordTextField text]];
            NSLog(@"dictionary : %@", responseDict);
            NSDictionary *loginResult = [responseDict objectForKey:LOGIN_API_LOGINRESULT_KEY];
            if ([[loginResult objectForKey:LOGIN_API_STATUS_KEY] isEqualToString:@"True"]) {
                NSArray *stdlist = [loginResult objectForKey:LOGIN_API_STDLIST_KEY];
                EKBUser *userObject = [[EKBUser alloc] init];
                userObject.userName = [self.userNameTextField text];
                userObject.password = [self.passwordTextField text];
                userObject.stdList = stdlist;
                NSMutableDictionary *detailsDict = [[loginResult objectForKey:LOGIN_API_USER_DETAILS_KEY] mutableCopy];
                userObject.userAddress = [detailsDict objectForKey:LOGIN_API_ADDRESS_KEY];
                userObject.userEmail = [detailsDict objectForKey:LOGIN_API_EMAIL_KEY];
                userObject.userIsMobileConfirm = [[detailsDict objectForKey:LOGIN_API_ISMOBILECONFIRM_KEY] integerValue];
                userObject.userMobile = [detailsDict objectForKey:LOGIN_API_MOBILE_KEY];
                userObject.userNameString = [detailsDict objectForKey:LOGIN_API_NAME_KEY];
                userObject.userRelation = [detailsDict objectForKey:LOGIN_API_RELATION_KEY];
                userObject.userId = [detailsDict objectForKey:LOGIN_API_ID_KEY];
                userObject.userPinCode = [detailsDict objectForKey:LOGIN_API_PINCODE_KEY];
                userObject.userVcrcity = [detailsDict objectForKey:LOGIN_API_CITY_KEY];
                userObject.userVcrstate = [detailsDict objectForKey:LOGIN_API_STATE_KEY];
                [EKBSingleton saveUserObject:userObject];
                [activityIndicatorView stopAnimating];
                [activityIndicatorView removeFromSuperview];
                
                // Get first Student's Details and Save as current user
                NSString *currentStudentId = [userObject.stdList objectAtIndex:0];
                NSDictionary *dictionary = [EKBAPICall getStudentDetailsForStudentId:currentStudentId];
                NSMutableDictionary *resultDict = [[dictionary objectForKey:STUDENT_DETAILS_API_RESULT_KEY] mutableCopy];
                EKBStudent *student = [[EKBStudent alloc] init];
                student.studentAadharNo = [resultDict objectForKey:STUDENT_DETAILS_API_AADHARNO_KEY];
                student.studentDiv = [resultDict objectForKey:STUDENT_DETAILS_API_DIV_KEY];
                student.studentDOB = [resultDict objectForKey:STUDENT_DETAILS_API_DOB_KEY];
                student.studentGRNo = [resultDict objectForKey:STUDENT_DETAILS_API_GRNO_KEY];
                student.studentId = [[resultDict objectForKey:STUDENT_DETAILS_API_ID_KEY] stringValue];
                student.studentMobile1 = [resultDict objectForKey:STUDENT_DETAILS_API_MOBILE1_KEY];
                student.studentMobile2 = [resultDict objectForKey:STUDENT_DETAILS_API_MOBILE2_KEY];
                student.studentName = [resultDict objectForKey:STUDENT_DETAILS_API_NAME_KEY];
                student.studentRollNo = [resultDict objectForKey:STUDENT_DETAILS_API_ROLL_NO_KEY];
                student.studentSchoolId = [resultDict objectForKey:STUDENT_DETAILS_API_SCHOOLID_KEY];
                student.studentStd = [resultDict objectForKey:STUDENT_DETAILS_API_STANDARD_KEY];
                [EKBSingleton saveCurrentStudent:student];
                
                return YES;
                
            } else {
                [activityIndicatorView stopAnimating];
                [activityIndicatorView removeFromSuperview];
                return NO;
            }
        }
        [activityIndicatorView stopAnimating];
        [activityIndicatorView removeFromSuperview];
        return NO;
    }
    
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    WebViewContentType contentType;
//    
//    if ([[segue identifier] isEqualToString:@"SuccessfulLoginSegue"]) { // For Login
//        contentType = kAfterLoggedInContent;
//        
//    } else if ([[segue identifier] isEqualToString:@"ForgotPasswordSegue"]) { // For Forgot Password
//        contentType = kForgotPasswordContent;
//        
//    } else if ([[segue identifier] isEqualToString:@"NewUserSegue"]) { // For New User
//        contentType = kNewUserContent;
//    }
//    
//    EKBMainViewController *destinationController = [segue destinationViewController];
//    destinationController.contentType = contentType;
}


@end
