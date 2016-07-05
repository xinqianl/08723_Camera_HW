//
//  Event.h
//  iDrift
//
//  Created by Sophie Jeong on 3/31/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;

@end
