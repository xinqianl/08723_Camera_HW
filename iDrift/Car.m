//
//  Car.m
//  Test3
//
//  Created by Sophie Jeong on 3/25/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import "Car.h"

@implementation Car

+(void) initWithMaker:(NSString *)maker withModel:(NSString *)model{
    //do ...
}

-(Boolean) canDrift {
    if ( (self.model !=nil)&&[self.model isEqual:@"Z4"])
        return true;
    else {
        
        return false;}
}
@end
