//
//  EKBForgotPasswordViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKBForgotPasswordViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet KDTextField *emailTextField;

@property (nonatomic, strong) IBOutlet UIButton *submitBtn;

- (IBAction)submitBtnClicked:(id)sender;

@end
