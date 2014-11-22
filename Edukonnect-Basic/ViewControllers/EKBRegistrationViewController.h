//
//  EKBRegistrationViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

typedef enum {
    
    kPickerViewTypeState,
    kPickerViewTypeCity
    
} PickerViewType;

@interface EKBRegistrationViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate, KDTextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) IBOutlet KDTextField *nameTextField;
@property (nonatomic, strong) IBOutlet KDTextField *emailTextField;
@property (nonatomic, strong) IBOutlet KDTextField *mobileTextField;
@property (nonatomic, strong) IBOutlet UITextView *addressTextField;
@property (nonatomic, strong) IBOutlet KDTextField *stateTextField;
@property (nonatomic, strong) IBOutlet KDTextField *cityTextField;
@property (nonatomic, strong) IBOutlet KDTextField *pinCodeTextField;
@property (nonatomic, strong) IBOutlet KDTextField *passwordTextField;
@property (nonatomic, strong) IBOutlet KDTextField *confirmPasswordTextField;
@property (nonatomic, strong) IBOutlet UIButton *checkBoxBtn;
@property (nonatomic, strong) IBOutlet UILabel *termsConditionsLabel;
@property (nonatomic, strong) IBOutlet UIButton *submitBtn;

@property (nonatomic) BOOL isTermsAgreed;


@end
