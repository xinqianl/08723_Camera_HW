//
//  CustomViewCell.h
//  iDrift
//
//  Created by Xinqian Li on 7/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell
@property (copy, nonatomic) NSString *tweet;
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) UITextView *tweetLabel;
@property (copy, nonatomic) UIButton *link;
@end
