//
//  EKBGallaryFolderViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBGallaryFolderViewController.h"
#import "EKBGallaryViewController.h"

@interface EKBGallaryFolderViewController ()

@end

@implementation EKBGallaryFolderViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gallaryFoldersArray = [[NSMutableArray alloc] init];
    self.gallaryFoldersArray = [EKBAPICall getGallaryFolders];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Gallery-Folders"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.gallaryFoldersArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"GallaryFolderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableDictionary *gallaryFolderDict = [[self.gallaryFoldersArray objectAtIndex:indexPath.row] mutableCopy];
    
    UILabel *folderName = (UILabel *) [cell.contentView viewWithTag:100];
    [folderName setText:[gallaryFolderDict objectForKey:GALLARY_FOLDER_API_NAME_KEY]];
    
    return cell;
}


#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowGallary"]) {
        EKBGallaryViewController *gallaryVC = (EKBGallaryViewController *) segue.destinationViewController;
        UITableViewCell *cell = (UITableViewCell *) sender;
        NSIndexPath *indexPath = [self.gallaryFoldersTableView indexPathForCell:cell];
        gallaryVC.gallaryDictFolder = [self.gallaryFoldersArray objectAtIndex:indexPath.row];
    }
}

@end
