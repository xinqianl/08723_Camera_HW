//
//  MasterViewController.h
//  Test0529
//
//  Created by Sophie Jeong on 5/31/16.
//  Copyright (c) 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "DetailViewController.h"


@class EventDetailViewController;

@interface SecondViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *myArr;

@end

