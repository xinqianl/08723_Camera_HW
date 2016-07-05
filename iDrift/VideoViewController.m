//
//  VideoViewController.m
//  iDrift
//
//  Created by Xinqian Li on 7/4/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:self.url];
                moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
                [moviePlayer.view setFrame:CGRectMake(20, 100, 380, 50)];
                moviePlayer.shouldAutoplay = YES;
                moviePlayer.allowsAirPlay = YES;
                [self.view addSubview:moviePlayer.view];
                [moviePlayer setFullscreen:YES];
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
