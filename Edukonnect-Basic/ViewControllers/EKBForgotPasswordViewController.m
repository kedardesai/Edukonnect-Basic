//
//  EKBForgotPasswordViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBForgotPasswordViewController.h"

@implementation EKBForgotPasswordViewController

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
    
    self.emailTextField.layer.cornerRadius = 2;
    [self.emailTextField setIsAnimated:YES];
    [self.emailTextField setTextFieldtype:kTextFieldTypeEmail];
    [self.emailTextField setNormalBorderColor:[UIColor KDTextFieldNormalBorderColor] errorBorderColor:[UIColor KDTextFieldErrorBorderColor] normalTextColor:[UIColor KDTextFieldTextColor] errorTextColor:[UIColor KDTextFieldTextColor] normalBorderWidth:1.0f errorBorderWidth:1.0f];
    
    self.submitBtn.layer.cornerRadius = 2.0f;
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Forgot Password"];
}

#pragma mark IBAction Methods

- (IBAction)submitBtnClicked:(id)sender
{
    [self.emailTextField validateTextFieldAnimated:YES];
}

#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
//    [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:[error localizedDescription]];
}

- (void)onSucess:(KDTextField *)textField
{
    NSLog(@"self.emailTextField id validated...");
    BOOL status = [EKBAPICall forgotPasswordWithEmailId:textField.text];
    if (status) {
        [EKBUtility showAlertViewWithTitle:@"SUCCESS" andMessage:@"New Password has been sent to your mentioned email id." withDelegate:self];
    } else {
        [EKBUtility showAlertViewWithTitle:@"ERROR" andMessage:@"Something went wrong. Please try again later."];
    }
}


#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
