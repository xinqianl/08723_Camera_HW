//
//  EventAnnotation.h
//  iDrift
//
//  Created by Sophie Jeong on 4/17/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface EventAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subTitle;
@property (nonatomic, retain) NSString *detailAddr;


@end
