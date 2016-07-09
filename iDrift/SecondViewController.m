#import "SecondViewController.h"
#import <sys/sysctl.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *tweetButton = [UIButton buttonWithType: UIButtonTypeCustom];
    
    tweetButton.frame = CGRectMake(100, 500, 150, 44);
    
    [tweetButton addTarget:self
                    action:@selector (tweetButtonPressed)
          forControlEvents: UIControlEventTouchUpInside];
    [tweetButton setTitle:@"Tweet Photo" forState:UIControlStateNormal];
    [tweetButton setBackgroundColor: [UIColor grayColor]];
    [self.view addSubview: tweetButton];
    
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
    NSString *localDate = [self getCurrentTimeString:([NSDate date])];
    NSString *timeZoneName = [[NSTimeZone systemTimeZone] abbreviation];
    NSString *curDate = [NSString stringWithFormat:@"%@%@%@", localDate, @" ", timeZoneName];
    self.info = [NSString stringWithFormat:@"%@%@", @"xinqianl ", curDate];
    
    self.imageView.image = selectedImage;
    [self dismissModalViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tweetButtonPressed{
    if([self checkPhoto]){
        [self noPhotoAlert];
        return;
    }
    ACAccountStore *twitter = [[ACAccountStore alloc] init];
    ACAccountType *twAccountType = [twitter accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [self check];
    [twitter requestAccessToAccountsWithType:twAccountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
                 [self generateAlert];
             }
             else
             {
                 SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                 [tweetSheet setInitialText: self.info];
                 [tweetSheet addImage:[self.imageView image]];
                 [self presentViewController:tweetSheet animated:YES completion:nil];
             }
             
         }
         else
         {
             [self permissionAlert];
         }
     }];
    
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

-(void) generateAlert{
    {dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"Please make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
        
    });
        return;
    }
}

-(void) permissionAlert{
    NSLog(@"Permission Not Granted");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Please make sure your device has an internet connection and you have at least one Twitter account setup"
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"OK", nil];
        [alert show];
        // code here
    });
    return;
}
-(void)check{
    ACAccountStore *twitter = [[ACAccountStore alloc] init];
    ACAccountType *twAccountType = [twitter accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    ACAccount *twAccount = [[ACAccount alloc] initWithAccountType:twAccountType];
    NSArray *accounts = [twitter accountsWithAccountType:twAccountType];
    twAccount = [accounts lastObject];
    NSURL *twitterURL = [[NSURL alloc] initWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
    SLRequest *requestUsersTweets = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                       requestMethod:SLRequestMethodGET
                                                                 URL:twitterURL
                                                          parameters:nil];
    
    [requestUsersTweets performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error2)
     {
         // The output of the request is placed in the log.
         NSLog(@"HTTP Response: %i", [urlResponse statusCode]);
         if([urlResponse statusCode]==0){
             dispatch_async(dispatch_get_main_queue(), ^{
                 UIAlertView *alertView = [[UIAlertView alloc]
                                           initWithTitle:@"Sorry"
                                           message:@"Please make sure your device has an internet connection and you have at least one Twitter account setup"
                                           delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
                 [alertView show];
                 return;
             });
         }
     }];
    
}
-(Boolean)checkPhoto{
    return self.imageView.image == nil;
}
-(void) noPhotoAlert{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Please make sure you add a photo."
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"OK", nil];
        [alert show];
        // code here
    });
}
@end
