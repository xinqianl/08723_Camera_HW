//
//  DetailViewController.m
//  iDrift
//
//  Created by Xinqian Li on 7/5/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(![self.tweet containsString:@"https"]){
    UITextView *label3 = [[UITextView alloc]
                       initWithFrame:CGRectMake (10.0f, 300.0f, 500.0f, 100.0f)];
    label3.text = self.tweet;
    [label3 setEditable:NO];
    [self.view addSubview: label3];
    NSLog(@"%@",self.tweet);
    }else{
        NSRange range = [self.tweet rangeOfString:@"https"];
        UITextView *label3 = [[UITextView alloc]
                              initWithFrame:CGRectMake (10.0f, 300.0f, 500.0f, 100.0f)];
        label3.text = [self.tweet substringToIndex:range.location];
        [label3 setEditable:NO];
        [self.view addSubview: label3];
        NSLog(@"%@",self.tweet);
        
        UIButton *sampleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [sampleButton setTitle:[self.tweet substringFromIndex:range.location] forState:UIControlStateNormal];
        sampleButton.frame = CGRectMake(10, 400, 150, 44);
        [sampleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [sampleButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [sampleButton sizeToFit];
        
        [sampleButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sampleButton];
    }
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonPressed{
    PhotoViewController *testController = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:testController animated:YES];
    NSRange range = [self.tweet rangeOfString:@"https"];
    NSString *path = [self.tweet substringFromIndex:range.location];
    NSURL *url = [NSURL URLWithString:path];
    NSLog(@"%@", path);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            testController.photoImageView.image= [UIImage imageWithData:imageData];
        });
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
