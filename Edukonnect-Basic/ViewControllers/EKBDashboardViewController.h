//
//  EKBDashboardViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBDashboardViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *dashboardScrollView;
@property (nonatomic, strong) IBOutlet UIButton *myChildBtn;
@property (nonatomic, strong) IBOutlet UIButton *noticeBtn;
@property (nonatomic, strong) IBOutlet UIButton *eventBtn;
@property (nonatomic, strong) IBOutlet UIButton *resultBtn;
@property (nonatomic, strong) IBOutlet UIButton *timetableBtn;
@property (nonatomic, strong) IBOutlet UIButton *gallaryBtn;
@property (nonatomic, strong) IBOutlet UIImageView *schoolLogo;
@property (nonatomic, strong) IBOutlet UILabel *schoolName;

- (IBAction)myChildBtnClicked:(UIButton *)myChildBtn;
- (IBAction)noticeBtnClicked:(UIButton *)noticeBtn;
- (IBAction)eventBtnClicked:(UIButton *)eventBtn;
- (IBAction)resultBtnClicked:(UIButton *)resultBtn;
- (IBAction)timetableBtnClicked:(UIButton *)timetableBtn;
- (IBAction)gallaryBtnClicked:(UIButton *)gallaryBtn;

@end
