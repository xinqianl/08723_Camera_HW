//
//  AssetViewController.m
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "AssetViewController.h"

@interface AssetViewController ()

@end

@implementation AssetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!self.isVideo){
    // Do any additional setup after loading the view.
        [self.assetImageView setImage:self.assetImage];
    }else{
        
        MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:self.videoURL];
        [self presentMoviePlayerViewControllerAnimated:player];
        
        player.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        [player.moviePlayer play];
       
        player = nil;
        

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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