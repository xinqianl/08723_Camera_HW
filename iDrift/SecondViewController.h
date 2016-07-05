//
//  SecondViewController.h
//  TabCombo
//
//  Created by Sophie Jeong on 3/26/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *maker1;
@property (weak, nonatomic) IBOutlet UILabel *model1;
@property (weak, nonatomic) IBOutlet UILabel *maker2;
@property (weak, nonatomic) IBOutlet UILabel *model2;
@property (weak, nonatomic) IBOutlet UILabel *answer;
- (IBAction)tab1:(id)sender;
- (IBAction)tab2:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) Car *car1;
@property (retain, nonatomic) Car *car2;

@end
