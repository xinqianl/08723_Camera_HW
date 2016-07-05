#import "UIImageCameraViewController.h"

@interface UIImageCameraViewController ()

@end

@implementation UIImageCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*
- (BOOL) videoRecordingAvailable
{
    // The source type must be available
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        return NO;
    
    // And the media type must include the movie type
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    return  [mediaTypes containsObject:@"public.video"];
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error){
       // self.title = @"Saved!";
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Drifting Video"
                                                      message:@"Saved!"
                                                     delegate:nil
                                            cancelButtonTitle:@"ok"
                                            otherButtonTitles:nil];
    
        [message show];
        
    }
    
    else
        NSLog(@"Error saving video: %@", error.localizedFailureReason);
}
 */

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//////     recover video URL
////    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
////    
//////     check if video is compatible with album
////    BOOL compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path);
////    
//////     save
////    if (compatible)
////        UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, @selector(video:didFinishSavingWithError:contextInfo:), NULL);
////        
////    
////
////        [self dismissModalViewControllerAnimated:YES];
////        imagePickerController = nil;
//
//}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissModalViewControllerAnimated:YES];
    imagePickerController = nil;
}

// Popover was dismissed
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)aPopoverController
{
    imagePickerController = nil;
    popoverController = nil;
}

- (IBAction) takePhoto: (id) sender
{
    if (popoverController)
        return;
    
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    //imagePickerController.allowsEditing = YES;
   // imagePickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
    //imagePickerController.videoMaximumDuration = 30.0f; // 30 seconds
    imagePickerController.mediaTypes = [NSArray arrayWithObject:@"public.image"];
    // imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.movie", @"public.image", nil];
    // not all devices have two cameras or a flash so just check here
    
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    
 
        [self presentModalViewController:imagePickerController animated:YES];
   
}

- (void)image:(UIImage *)image
didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    
    if(error != nil)
    {
        NSLog(@"Error Saving:%@",[error localizedDescription]);
        return;
    }
 
}
#pragma mark - Image Picker Controller Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage =
    [info objectForKey:UIImagePickerControllerEditedImage];
    
    if (!selectedImage)
    {
        
        selectedImage =
        [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
    
    UIImageWriteToSavedPhotosAlbum(selectedImage, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   NULL);
    self.imageView.image = selectedImage;
    [self dismissModalViewControllerAnimated:YES];
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
- (NSString *) getCurrentTimeString: (NSDate *) nowDate{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [gregorian components:
                                        (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|
                                         NSCalendarUnitHour  | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                                    fromDate:nowDate];
    
    NSInteger hour = [dateComponents hour];
    NSInteger minute = [dateComponents minute];
    NSInteger second = [dateComponents second];
    
    NSInteger year = [dateComponents year];
    NSInteger month = [dateComponents month];
    NSInteger day = [dateComponents day];
    
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",
            (long)year, (long) month, (long)day,(long)hour, (long)minute, (long)second];
    
    
}

@end
