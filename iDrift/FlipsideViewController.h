//
//  FlipsideViewController.h
//  Test7
//
//  Created by Sophie Jeong on 3/26/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) NSURL *myURL;

- (IBAction)done:(id)sender;
- (IBAction)startPlay:(id)sender;

@end
