//
//  PhotoViewController.m
//  iDrift
//
//  Created by Xinqian Li on 7/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.imageURL]];
    UIImageView *imView = [[UIImageView alloc] initWithImage:[UIImage imageWithData: imageData]];
    [imView setFrame:[[UIScreen mainScreen] bounds]];
    imView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imView];
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
