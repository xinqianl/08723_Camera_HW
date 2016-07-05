//
//  SecondViewController.m
//  TabCombo
//
//  Created by Sophie Jeong on 3/26/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    _car1 = [[Car alloc] init];
    _car2 = [[Car alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    _car1.maker = _maker1.text;
    _car1.model = _model1.text;
    
    _car2.maker = _maker2.text;
    _car2.model = _model2.text;
    
    _answer.text = @" ";
     
     */
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"IDrift" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    NSURLRequest *fileRequest = [NSURLRequest requestWithURL:url];
    NSString *urlRequest =@"http://imposing-mind-552.appspot.com";
   // [self.webView loadRequest:fileRequest];
    
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlRequest]]];
    
    _webView.mediaPlaybackRequiresUserAction = NO;
    _webView.allowsInlineMediaPlayback = YES;
    _webView.mediaPlaybackAllowsAirPlay = YES;
  
    

}
#pragma mark UIWebViewDelegate




- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
	self.webView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.webView.delegate = self;	// setup the delegate as the web view is shown
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [self.webView stopLoading];	// in case the web view is still loading its content
	self.webView.delegate = nil;	// disconnect the delegate as the webview is hidden
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tab1:(id)sender {
    
    if ([_car1 canDrift])
        _answer.text = @"can drift.";
    
    else {
        _answer.text=[@"Can't.  It is FWD: " stringByAppendingFormat:
                      @" %@  %@ ", _car1.maker, _car1.model];
        NSLog(@"not drift");
        
    }
}

- (IBAction)tab2:(id)sender {
    
    if ([_car2 canDrift]){
        _answer.text=[@"Yes it can. It is RWD:" stringByAppendingFormat:
                      @" %@  %@", _car2.maker, _car2.model];
    }
    
    
    else _answer.text=@"can't drift.";;
}



@end
