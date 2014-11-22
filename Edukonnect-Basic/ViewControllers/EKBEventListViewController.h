//
//  EKBEventListViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBEventListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *eventListTableView;

@property (nonatomic, strong) NSMutableArray *eventsArray;

@property (nonatomic, strong) NSMutableDictionary *selectedEventDict;

@end
