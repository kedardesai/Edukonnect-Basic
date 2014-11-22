//
//  EKBGallaryViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBGallaryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *imageCollectionView;

@property (nonatomic, strong) NSMutableDictionary *gallaryDictFolder;

@property (nonatomic, strong) NSMutableArray *gallaryImageArray;

@end
