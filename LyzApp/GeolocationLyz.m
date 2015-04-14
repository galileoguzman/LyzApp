//
//  GeolocationLyz.m
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "GeolocationLyz.h"

@implementation GeolocationLyz

@synthesize name;
@synthesize coordinate;

- (id)initWithCordinate:(CLLocationCoordinate2D)coord
{
    self = [super init];
    coordinate = coord;
    return self;
}

@end
