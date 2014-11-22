//
//  EKBMainViewController.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBMainViewController.h"
#import "EKBConstants.h"
#import "EKBUser.h"
#import "EKBSingleton.h"
#import "EKBLoginViewController.h"

@interface EKBMainViewController ()

@property (nonatomic, strong) NSString *urlString;

@end

@implementation EKBMainViewController

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
    
    self.title = @"Edukonnect - Basic";
    self.navigationItem.hidesBackButton = YES;
    
    switch (self.contentType) {
        case kAfterLoggedInContent:
        {
            EKBUser *userObj = [EKBSingleton loadUserObject];
            NSArray *userSubtringArray = [userObj.userName componentsSeparatedByString:@"@"];
            self.urlString = [NSString stringWithFormat:@"%@username=%@&password=%@&end=%@", LOGIN_URL, [userSubtringArray objectAtIndex:0], userObj.password, [userSubtringArray objectAtIndex:1]];
        }
            break;
            
        case kForgotPasswordContent:
            self.urlString = [NSString stringWithFormat:@"%@", FORGOT_PASSWORD_URL];
            break;
            
        case kNewUserContent:
            self.urlString = [NSString stringWithFormat:@"%@", NEW_USER_URL];
            break;
            
        default:
            self.urlString = @"";
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSURL *finalURL = [NSURL URLWithString:self.urlString];
    NSLog(@"finalURL ::: %@",finalURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:finalURL];
    
    [self.mainWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UIWebViewDelegate Methods

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSLog(@"Loaded url: %@", [[request URL] absoluteString]);
    if ([[[request URL] absoluteString] isEqualToString:WEB_LOGIN_URL]) {
        BOOL isDeleted = NO;
        for (UIViewController *viewController in [self.navigationController viewControllers]) {
            if ([viewController isKindOfClass:[EKBLoginViewController class]]) {
                [webView stopLoading];
                [EKBSingleton removeUserObject];
                EKBLoginViewController *loginViewController = (EKBLoginViewController *) viewController;
                [self.navigationController popToViewController:loginViewController animated:YES];
                isDeleted = YES;
            }
        }
        if (!isDeleted) {
            [EKBSingleton removeUserObject];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_Storyboard_iPhone" bundle:[NSBundle mainBundle]];
            EKBLoginViewController *loginViewController = (EKBLoginViewController *) [storyboard instantiateViewControllerWithIdentifier:@"EKBLoginViewController"];
            [self.navigationController pushViewController:loginViewController animated:YES];
        }
        
        return NO;
    }
    
    return YES;
    
}

@end
