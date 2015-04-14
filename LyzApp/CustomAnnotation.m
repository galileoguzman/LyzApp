//
//  CustomAnnotation.m
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "CustomAnnotation.h"


@implementation CustomAnnotation

@synthesize title, subtitle, coordinate;

// Implementamos el método de inicialización del objeto.
- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord
{
    self = [super init];
    title = aTitle;
    subtitle = aSubtitle;
    coordinate = coord;
    return self;
}
- (id)initWithCordinate:(CLLocationCoordinate2D)coord
{
    self = [super init];
    coordinate = coord;
    return self;
}

@end
