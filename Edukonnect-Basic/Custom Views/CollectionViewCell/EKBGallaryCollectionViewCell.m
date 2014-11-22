//
//  EKBGallaryCollectionViewCell.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBGallaryCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface EKBGallaryCollectionViewCell ()

@property (nonatomic, strong) IBOutlet UIView *view;

- (void)commonInit;
- (void)showData;

@end

@implementation EKBGallaryCollectionViewCell

#pragma mark UIViewLifeCycle Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

#pragma mark Setter Methods

- (void)setCellContectDict:(NSMutableDictionary *)cellContectDict
{
    _cellContectDict = cellContectDict;
    [self commonInit];
    [self showData];
}

#pragma mark Code-Reusable Methods

- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"EKBGallaryCollectionViewCell" owner:self options:nil];
    [self addSubview:self.view];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.imageDesc.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1.0f] CGColor], nil];
    [self.imageDesc.layer insertSublayer:gradient atIndex:0];
    
    self.layer.borderColor = [[UIColor colorWithRed:135.0f/255.0f green:135.0f/255.0f blue:135.0f/255.0f alpha:1.0f] CGColor];
    self.layer.borderWidth = 0.6f;
}

- (void)showData
{
    if (![[self.cellContectDict objectForKey:GALLARY_IMAGE_API_DESC_KEY] isEqual:[NSNull null]]) {
        [self.imageDesc setText:[self.cellContectDict objectForKey:GALLARY_IMAGE_API_DESC_KEY]];
    } else {
        [self.imageDesc setHidden:YES];
    }
    
    NSString *imagePath = [NSString stringWithFormat:@"http://www.edukonnect.net.in/Images/Gallary/%@", [self.cellContectDict objectForKey:GALLARY_IMAGE_API_IMAGE_KEY]];
    [self.imageView setImageWithURL:[NSURL URLWithString:imagePath]];
}

@end
