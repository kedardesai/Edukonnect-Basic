//
//  EKBTeacherLoginViewController.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 2/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKBTeacherLoginViewController.h"

@interface EKBTeacherLoginViewController ()

@end

@implementation EKBTeacherLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
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
