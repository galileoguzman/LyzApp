//
//  GeolocationLyz.h
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GeolocationLyz : NSObject{
    NSString *name;
    CLLocationCoordinate2D coordinate;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCordinate:(CLLocationCoordinate2D)coord;

@end
