//
//  EKBAppDelegate.m
//  Edukonnect-Basic
//
//  Created by Ninad Desai on 08/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBAppDelegate.h"
#import "EKBAPICall.h"
#import "EKBUser.h"
#import "EKBSingleton.h"
#import "EKBConstants.h"
#import "EKBMainViewController.h"
#import "EKBDashboardViewController.h"

@implementation EKBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound
                                                                                                              categories:nil]];
    }
    
    if ([EKBSingleton loadUserObject]) {
        EKBUser *currentUser = [EKBSingleton loadUserObject];
        NSMutableDictionary *responseDict = [EKBAPICall callLoginAPIWithUserName:currentUser.userName andPassword:currentUser.password];
        NSLog(@"dictionary : %@", responseDict);
        NSDictionary *loginResult = [responseDict objectForKey:LOGIN_API_LOGINRESULT_KEY];
        if ([[loginResult objectForKey:LOGIN_API_STATUS_KEY] isEqualToString:@"True"]) {
            NSArray *stdlist = [loginResult objectForKey:LOGIN_API_STDLIST_KEY];
            [EKBSingleton saveUserWithUserName:currentUser.userName password:currentUser.password andStdList:stdlist];
        }
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_Storyboard_iPhone" bundle:[NSBundle mainBundle]];
//        EKBDashboardViewController *dashboardViewController = [storyboard instantiateViewControllerWithIdentifier:@"EKBDashboardViewController"];
        
//        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//        window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"EKBDashboardViewController"];
        
    [(UINavigationController*)self.window.rootViewController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"EKBDashboardViewController"] animated:NO];

        
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Background-Fetch Data Methods

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    UIApplication* app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    
    // Clear out the old notification before scheduling a new one.
    if ([oldNotifications count] > 0)
        [app cancelAllLocalNotifications];
    
    EKBUser *currentUser = [EKBSingleton loadUserObject];
    NSArray *studentList = currentUser.stdList;
    for (NSString *studentId in studentList) {
        // Create a new notification.
        NSMutableDictionary *responseDictionary = [EKBAPICall checkForBackgroundUpdatesForStudentId:studentId].mutableCopy;
        if (responseDictionary) {
            NSString *notificationString = [responseDictionary objectForKey:@"GetNotificationsResult"];
            notificationString = [notificationString stringByReplacingOccurrencesOfString:@"[" withString:@""];
            notificationString = [notificationString stringByReplacingOccurrencesOfString:@"]" withString:@""];
            
            NSError *error = nil;
            
            NSDictionary *notificationDictionary = [NSJSONSerialization JSONObjectWithData: [notificationString dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];
            
            if (!error) {
                NSDate *now = [NSDate date];
                UILocalNotification *instantAlarm = [[UILocalNotification alloc] init];
                if (instantAlarm)
                {
                    instantAlarm.fireDate = now;
                    instantAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    instantAlarm.repeatInterval = 0;
                    instantAlarm.alertBody = [notificationDictionary objectForKey:@"Message"];
                    [app scheduleLocalNotification:instantAlarm];
                }
                completionHandler(UIBackgroundFetchResultNewData);
            } else {
                completionHandler(UIBackgroundFetchResultFailed);
            }
            
        } else {
            completionHandler(UIBackgroundFetchResultNoData);
        }
    }
    
}


@end
