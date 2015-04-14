//
//  Share.h
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "GeolocationLyz.h"

@interface Share : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>{
    CLLocationCoordinate2D coord;
    GeolocationLyz *geo;
}


@property (nonatomic, readonly) CLLocationCoordinate2D coord;
@property (strong, nonatomic) IBOutlet GeolocationLyz *geo;

@property (strong, nonatomic) IBOutlet MKMapView *mkMap;
@property (strong, nonatomic) IBOutlet UITextField *txtNameGeolocation;
- (IBAction)btnShareSender:(id)sender;
- (IBAction)btnCalcelShareSender:(id)sender;

@end
