//
//  EKBGallaryViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBGallaryViewController.h"
#import "EKBGallaryCollectionViewCell.h"
#import "EKBImageViewController.h"

@implementation EKBGallaryViewController

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
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.gallaryImageArray = [[NSMutableArray alloc] init];
    NSNumber *gallaryId = (NSNumber *) [self.gallaryDictFolder objectForKey:GALLARY_FOLDER_API_GID_KEY];
    self.gallaryImageArray = [EKBAPICall getGallaryForGallaryId:gallaryId];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Gallery"];
}

#pragma mark UICollectionView Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.gallaryImageArray count];
}

- (EKBGallaryCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"GallaryImageCollectionViewCell";
    EKBGallaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSMutableDictionary *contentDict = [[self.gallaryImageArray objectAtIndex:indexPath.row] mutableCopy];
    
    [cell setCellContectDict:contentDict];
    
    return cell;
}

#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowImage"]) {
        EKBGallaryCollectionViewCell *cell = (EKBGallaryCollectionViewCell *) sender;
        NSIndexPath *indexPath = [self.imageCollectionView indexPathForCell:cell];
        EKBImageViewController *imageVC = (EKBImageViewController *) segue.destinationViewController;
        imageVC.imageDict = [self.gallaryImageArray objectAtIndex:indexPath.row];
    }
}

@end
