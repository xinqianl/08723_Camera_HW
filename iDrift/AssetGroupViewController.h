//
//  AssetGroupViewController.h
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FlipsideViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface AssetGroupViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray *assetArray;
@property (nonatomic, strong) NSURL *assetGroupURL;
@property (nonatomic, strong) NSString *assetGroupName;
@property (nonatomic, strong) IBOutlet UITableView *assetTableView;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end
