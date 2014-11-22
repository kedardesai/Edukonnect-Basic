//
//  EKBLoginViewController.h
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 08/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKBLoginViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIView *loginComponentsView;

@property (nonatomic, strong) IBOutlet KDTextField *userNameTextField;
@property (nonatomic, strong) IBOutlet KDTextField *passwordTextField;

@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UIButton *forgotPasswordButton;
@property (nonatomic, strong, getter = theNewUser) IBOutlet UIButton *newUserButton;

- (IBAction)loginButtonClicked:(UIButton *)loginButton;
- (IBAction)forgotPasswordButtonClicked:(UIButton *)forgotPasswordButton;
- (IBAction)newUserButtonClicked:(UIButton *)newUserButton;

@end
