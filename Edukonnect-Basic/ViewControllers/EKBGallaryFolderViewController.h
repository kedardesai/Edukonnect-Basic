//
//  EKBGallaryFolderViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBGallaryFolderViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *gallaryFoldersTableView;

@property (nonatomic, strong) NSMutableArray *gallaryFoldersArray;


@end
