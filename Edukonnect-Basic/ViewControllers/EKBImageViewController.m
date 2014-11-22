//
//  EKBImageViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBImageViewController.h"
#import "UIImageView+AFNetworking.h"

@interface EKBImageViewController ()

@end

@implementation EKBImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    if (![[self.imageDict objectForKey:GALLARY_IMAGE_API_DESC_KEY] isEqual:[NSNull null]]) {
        [self.imageDesc setText:[self.imageDict objectForKey:GALLARY_IMAGE_API_DESC_KEY]];
    } else {
        [self.imageDesc setHidden:YES];
    }
    
    NSString *imagePath = [NSString stringWithFormat:@"http://www.edukonnect.net.in/Images/Gallary/%@", [self.imageDict objectForKey:GALLARY_IMAGE_API_IMAGE_KEY]];
    [self.imageView setImageWithURL:[NSURL URLWithString:imagePath]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = [NSString stringWithFormat:@"Image"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
