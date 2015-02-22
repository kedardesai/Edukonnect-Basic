//
//  EKBTimeTableViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBTimeTableViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *timeTableImageView;
@property (nonatomic, strong) IBOutlet UILabel *imageName;
@property (nonatomic, strong) IBOutlet UILabel *studentDiv;
@property (nonatomic, strong) IBOutlet UIButton *downloadImageBtn;

@property (nonatomic, strong) NSString *imagePath;

- (IBAction)downloadImageClicked:(id)sender;

@end
