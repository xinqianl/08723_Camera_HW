//
//  AssetLibraryViewController.h
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetLibraryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *assetGroupArray;
@property (nonatomic, strong) IBOutlet UITableView *assetGroupTableView;
@property (nonatomic, strong) NSURL *selectedGroupURL;

- (void)setupAssetData;

@end
