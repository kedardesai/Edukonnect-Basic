//
//  EKBEventDetailsViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBEventDetailsViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel *eventNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *eventDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *eventTimeLabel;
@property (nonatomic, strong) IBOutlet UIImageView *eventImageView;
@property (nonatomic, strong) IBOutlet UITextView *eventMessageTextView;

@property (nonatomic, strong) NSMutableDictionary *eventDict;

@end
