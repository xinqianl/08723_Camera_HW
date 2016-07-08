
//
//  CustomViewCell.m
//  iDrift
//
//  Created by Xinqian Li on 7/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "CustomViewCell.h"
#import "PhotoViewController.h"
@implementation CustomViewCell{
   
}
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGRect tweetLabelRect = CGRectMake(10, 10, 350, 15);
        _tweetLabel= [[UILabel alloc]initWithFrame:tweetLabelRect];
        [self.contentView addSubview:_tweetLabel];
       
        CGRect imgLinkRect = CGRectMake(10, 30, 350, 30);
        _link= [[UIButton alloc]initWithFrame:imgLinkRect];
        [_link setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_link];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) setTweet:(NSString *)tweet{
    if(![tweet isEqualToString:_tweet]){
        _tweet = [tweet copy];
        _tweetLabel.text = _tweet;
        
    }
    
}
-(void) setImage:(NSString *)image{
    if(![image isEqualToString:_image]){
        _image = [image copy];
        [_link setTitle:_image forState:UIControlStateNormal];
       
    }
}


@end
