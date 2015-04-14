//
//  Index.h
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Index : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>
{
    
}
//TextFields

@property (strong, nonatomic) IBOutlet UITextField *txNameGeolocation;

//Mapa
@property (strong, nonatomic) IBOutlet MKMapView *mkMapa;

//Buttons
- (IBAction)btnSaveSender:(id)sender;

- (IBAction)btnGetCurrentLocation:(id)sender;

@end
    