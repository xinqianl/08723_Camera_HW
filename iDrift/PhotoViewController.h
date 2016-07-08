//
//  PhotoViewController.h
//  iDrift
//
//  Created by Xinqian Li on 7/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) NSString *imageURL;

@end
