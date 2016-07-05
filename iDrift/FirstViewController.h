//
//  FirstViewController.h
//  TabCombo
//
//  Created by Sophie Jeong on 3/26/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipsideViewController.h"
#import <MediaPlayer/MediaPlayer.h>




@interface FirstViewController : UIViewController<FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
- (IBAction)togglePopover:(id)sender;

- (IBAction)startPlay:(id)sender;

@end
