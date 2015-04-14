//
//  Index.m
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Index.h"
#import "CustomAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface Index ()

@end

@implementation Index{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    CLLocationCoordinate2D zoomLocation;
    CLLocation *currentLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"LyzApp"];
    
    //Init Location Manager
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    
    
    
    
    //Setup MapKit
    
    
    zoomLocation.latitude = 17.0874204;
    zoomLocation.longitude= -96.7401281;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mkMapa setRegion:viewRegion animated:YES];
    
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mkMapa addGestureRecognizer:lpgr];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mkMapa];
    CLLocationCoordinate2D touchMapCoordinate = [self.mkMapa convertPoint:touchPoint toCoordinateFromView:self.view];
    
    CustomAnnotation *annot = [[CustomAnnotation alloc] init];
    [annot initWithCordinate:touchMapCoordinate];
    
    NSLog(@"Gesture recognizer Latitude: %f and Longitude: %f", touchMapCoordinate.latitude, touchMapCoordinate.longitude);
    
    [self.mkMapa addAnnotation:annot];
}

- (IBAction)btnSaveSender:(id)sender {
}

- (IBAction)btnGetCurrentLocation:(id)sender {
    NSLog(@"Presiono el botton del nav superior");
    
    //Get current location by Location Manager
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    currentLocation = newLocation;
    
    if (currentLocation != nil) {
        //longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        zoomLocation.latitude = currentLocation.coordinate.latitude;
        zoomLocation.longitude= currentLocation.coordinate.longitude;
        
        CustomAnnotation *annotation = [[CustomAnnotation alloc]initWithTitle: @"Tu Ubicación actual"
                                                                     subtitle: @"Oficina de LyzApp"
                                                                andCoordinate:zoomLocation];
        [self.mkMapa addAnnotation:annotation];
        
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        // 3
        [_mkMapa setRegion:viewRegion animated:YES];
        
        NSLog(@"%.8f", currentLocation.coordinate.longitude);
        NSLog(@"%.8f", currentLocation.coordinate.latitude);
        
    }
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error == nil && [placemarks count] > 0){
            placemark = [placemarks lastObject];
            
        }
    }];
}
@end
