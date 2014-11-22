//
//  EKBNoticeListViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBNoticeListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *noticeListTableView;

@property (nonatomic, strong) NSMutableArray *noticeListArray;

@end
