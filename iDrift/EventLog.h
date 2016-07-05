//
//  EventLog.h
//  iDrift
//
//  Created by Sophie Jeong on 4/4/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EventLog : NSManagedObject

@property (nonatomic, retain) NSString *eventName;
@property (nonatomic, retain) NSString *eventTime;
@property (nonatomic, retain) NSString *eventLocation;

@end
