//
//  EKBImageViewController.h
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKBImageViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *imageDict;

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *imageDesc;

@end
