//
//  EKBGallaryCollectionViewCell.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBGallaryCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) IBOutlet UILabel *imageDesc;

@property (nonatomic, strong) NSMutableDictionary *cellContectDict;

@end
