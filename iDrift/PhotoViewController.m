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
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://pbs.twimg.com/media/CmpvKcrWgAAKM34.jpg"]];
    UIImageView *imView = [[UIImageView alloc] initWithImage:[UIImage imageWithData: imageData]];
    imView.frame = [[UIScreen mainScreen] applicationFrame];
    [self.view addSubview:imView];
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [[self.view.window layer] addAnimation:animation forKey:@"layerAnimation"];
    [self.tabBarController.tabBar setHidden:YES];
    
    // Do any additional setup after loading the view.
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
