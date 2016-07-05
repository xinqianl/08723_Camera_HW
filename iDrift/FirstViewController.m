#import "FirstViewController.h"



@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Flipside View Controller

//- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    } else {
//        [self.flipsidePopoverController dismissPopoverAnimated:YES];
//    }
//}
//
//- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
//{
//    self.flipsidePopoverController = nil;
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
//        [[segue destinationViewController] setDelegate:self];
//        
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
//            self.flipsidePopoverController = popoverController;
//            popoverController.delegate = self;
//        }
//    }
//}
//
//- (IBAction)togglePopover:(id)sender {
//    if (self.flipsidePopoverController) {
//        [self.flipsidePopoverController dismissPopoverAnimated:YES];
//        self.flipsidePopoverController = nil;
//    } else {
//        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
//    }
//}

- (IBAction)startPlay:(id)sender  {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IDrift" ofType:@"mp4"];
    
    MPMoviePlayerViewController *theMovieController=[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]] ;
    NSLog(@"%@", [NSURL fileURLWithPath:path]);
    
    [theMovieController.view setFrame:CGRectMake(0, 44, 320, 270)];
    
    [theMovieController.view setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    [self.view addSubview: theMovieController.view];
    //
    
    // Create a new movie player object.
    MPMoviePlayerController *mp = [theMovieController moviePlayer];
    
    [mp prepareToPlay];
    mp.controlStyle = MPMovieControlStyleNone;
    //[mp setControlStyle:2];
    //[mp setScalingMode:MPMovieScalingModeFill];
    [mp setFullscreen:YES animated:YES];
    
    // Register for the playback finished notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinishedCallback:)
     
                                                 name:MPMoviePlayerPlaybackDidFinishNotification object:mp];
    [mp play];
    
    
}

- (void)playbackFinishedCallback:(NSNotification *)notification {
    
    MPMoviePlayerViewController *mpviewController = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:mpviewController];
    
    [mpviewController.view removeFromSuperview];
}

- (void)moviePlaybackComplete:(NSNotification *)notification
{
    //NSLog(notification.name);
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    
    [moviePlayerController.view removeFromSuperview];
    //[moviePlayerController release];
}
-(void)myMovieFinishedCallback:(NSNotification*)aNotification
{
    //NSLog(aNotification.name);
    MPMoviePlayerController* theMovie=[aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie];
    // [theMovie release]; no more ARC
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
    
}

- (void)viewDidDisappear{
    
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
