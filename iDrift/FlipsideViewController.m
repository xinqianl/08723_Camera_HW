//
//  FlipsideViewController.m
//  Test7
//
//  Created by Sophie Jeong on 3/26/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import "FlipsideViewController.h"
#define BUTTON_TAG		9999
@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}


- (IBAction)startPlay:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IDrift" ofType:@"mp4"];
    
	MPMoviePlayerViewController *theMovieController=[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]] ;

   // NSURL *url= theMovie.contentURL;
  //  NSString *urlName= [url path];
  //  NSLog(urlName);
 
    
    /* Size movie view to fit parent view. */
	//CGRect viewInsetRect = CGRectInset ([self.view bounds],0.0,44.0 );
    
   [theMovieController.view setFrame:CGRectMake(0, 44, 320, 270)];
    

    
    /* To present a movie in your application, incorporate the view contained
     in a movie player’s view property into your application’s view hierarchy.
     Be sure to size the frame correctly. */

    [self.view addSubview: theMovieController.view];
   //

     // Create a new movie player object.
    MPMoviePlayerController *mp = [theMovieController moviePlayer];
    
    [mp prepareToPlay];
    [mp setControlStyle:2];
    [mp setFullscreen:YES animated:YES];
    
        // Register for the playback finished notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinishedCallback:)
                                    name:MPMoviePlayerPlaybackDidFinishNotification object:mp];
    [mp play];
    
    
    // Movie playback is asynchronous, so this method returns immediately.
    
}

- (void)playbackFinishedCallback:(NSNotification *)notification {
    
    MPMoviePlayerViewController *mpviewController = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:mpviewController];
    
    //[mpviewController.view removeFromSuperview];
}
/*
- (void)playbackFinishedCallback:(NSNotification *)notification
{

    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
	
    [moviePlayerController.view removeFromSuperview];
    //[moviePlayerController release];
}
*/

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
