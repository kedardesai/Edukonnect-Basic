//
//  EKBStudentListViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBStudentListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *studentListTableView;

@property (nonatomic, strong) NSMutableArray *studentListArray;

@end
