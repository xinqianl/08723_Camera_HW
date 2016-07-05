//
//  Car.h
//  Test3
//
//  Created by Sophie Jeong on 3/25/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject 

@property (retain, nonatomic) NSString *maker;
@property (retain, nonatomic) NSString *model;

+(void) initWithMaker:(NSString *)maker withModel:(NSString *)model;
-(Boolean) canDrift;
@end
