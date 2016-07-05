//
//  UIImageCameraViewController.h
//  iDrift
//
//  Created by Sophie Jeong on 6/20/15.
//  Copyright © 2015 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageCameraViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate>
{
    UIPopoverController *popoverController;
    UIImagePickerController *imagePickerController;
}
- (IBAction)takePhoto:(id)sender;
@end
