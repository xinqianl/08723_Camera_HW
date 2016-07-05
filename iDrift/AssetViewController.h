//
//  AssetViewController.h
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AssetViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIImageView *assetImageView;
@property (nonatomic, strong) UIImage *assetImage;
@property (nonatomic, strong) NSURL *videoURL;
@property Boolean *isVideo;
@end
