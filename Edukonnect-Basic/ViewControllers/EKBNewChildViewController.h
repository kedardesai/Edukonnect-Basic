//
//  EKBNewChildViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKBNewChildViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
