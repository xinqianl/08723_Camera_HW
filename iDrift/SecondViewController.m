#import "SecondViewController.h"
#import "DetailViewController.h"

@interface SecondViewController ()

@property NSMutableArray *objects;
@end

@implementation SecondViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    self.myArr=[[NSMutableArray alloc]init];
    
    [self readTweet];
//    NSLog(@"%@",self.myArr);
   
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.myArr=[[NSMutableArray alloc]init];
    
    [self readTweet];
//    NSLog(@"%@",self.myArr);
}
- (void)didReceiveMemoryWarning {
    [self readTweet];
    [super didReceiveMemoryWarning];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
   
    return self.myArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *tweet = [self.myArr objectAtIndex:indexPath.row];
//    if(![tweet containsString:@"https"]){
        cell.textLabel.text =tweet;
//    }else{
//        NSRange range = [tweet rangeOfString:@"https"];
//    UIButton *sampleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    sampleButton.frame = CGRectZero;
//    [sampleButton setTitle:[tweet substringFromIndex:range.location] forState:UIControlStateNormal];
//    [cell.contentView addSubview:sampleButton];
//    
//    cell.textLabel.text =[tweet substringToIndex:range.location];;
//    }
    return cell;
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSLog(@"showDetail");
        
        self.detailViewController = [segue destinationViewController];
       
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController.tweet = self.myArr[indexPath.row];
    NSLog(@"%@", self.myArr[indexPath.row]);
   
}
- (void)readTweet {
    
    NSArray *tweets = [[NSArray alloc]init];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 140);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    ACAccountStore *twitter = [[ACAccountStore alloc] init];
    ACAccountType *twAccountType = [twitter accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    // Request Access to the twitter account
    [twitter requestAccessToAccountsWithType:twAccountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
                 [self generateAlert];
                 return;
             }
             ACAccount *twAccount = [[ACAccount alloc] initWithAccountType:twAccountType];
             NSArray *accounts = [twitter accountsWithAccountType:twAccountType];
             twAccount = [accounts lastObject];
             NSURL *twitterURL = [[NSURL alloc] initWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
             SLRequest *requestUsersTweets = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                                requestMethod:SLRequestMethodGET
                                                                          URL:twitterURL
                                                                   parameters:nil];
             
             [requestUsersTweets setAccount:twAccount];
             [requestUsersTweets performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error2)
              {
//                  NSLog(@"HTTP Response: %i", [urlResponse statusCode]);
                  if([urlResponse statusCode]!=200){
                      [self noResponseAlert];
                      return;
                  }
                  if([urlResponse statusCode]==200){
                  NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                  NSArray *timeline = (NSArray*)jsonResponse;
                  for (int i=0; i<[timeline count]; i++) {
                      NSString *text = [[timeline objectAtIndex:i] valueForKey:(@"text")];
                      
                     
                          [self.myArr addObject: text];
                      
                  }
//                  NSLog(@"%@",self.myArr);
                  dispatch_async(dispatch_get_main_queue(), ^{
                      [self.tableView reloadData];
                  });
                  }
                  
              }
              ];
//             NSLog(@"%@",self.myArr);
             twAccount = nil;
             accounts = nil;
             twitterURL = nil;
             requestUsersTweets = nil;
         }
         else
         {
             [self permissionAlert];
         }
     }];
    [spinner stopAnimating];
    twAccountType = nil;

}

-(void)generateAlert{
    dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"Please make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
    [alertView show];
    return;});

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
    });
    return;
}
-(void) noResponseAlert{
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
@end

