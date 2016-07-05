//
//  AssetGroupTableCell.h
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetGroupTableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *assetImageView1;
@property (nonatomic, strong) IBOutlet UIImageView *assetImageView2;
@property (nonatomic, strong) IBOutlet UIImageView *assetImageView3;
@property (nonatomic, strong) IBOutlet UIImageView *assetImageView4;

@property (nonatomic, strong) IBOutlet UIButton *assetButton1;
@property (nonatomic, strong) IBOutlet UIButton *assetButton2;
@property (nonatomic, strong) IBOutlet UIButton *assetButton3;
@property (nonatomic, strong) IBOutlet UIButton *assetButton4;

@end
