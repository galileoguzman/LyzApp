//
//  Share.m
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Share.h"
#import "CustomAnnotation.h"

#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface Share ()

@end

@implementation Share

@synthesize geo;
@synthesize coord;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Share with friends"];
    
    NSLog(@"Gesture recognizer Latitude: %f and Longitude: %f", geo.coordinate.latitude, geo.coordinate.longitude);
    
    
    CustomAnnotation *annotation = [[CustomAnnotation alloc]initWithTitle: @"Tu Ubicación actual"
                                                                 subtitle: @"Oficina de LyzApp"
                                                            andCoordinate:geo.coordinate];
    [self.mkMap addAnnotation:annotation];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(geo.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mkMap setRegion:viewRegion animated:YES];
    
    
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

- (IBAction)btnShareSender:(id)sender {
    
    //Properties to share with friends
    NSString *strMsg;
    NSArray *activityItems;
    UIActivityViewController *actVC;
    
    //Message with data
    strMsg = @"Galileo Guzmán ha compartido contigo la siguiente ubicación";
    activityItems = @[self.mkMap, self.txtNameGeolocation];
    
    
    //Init activity view controller
    actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    [self presentViewController:actVC animated:YES completion:nil];
    
    
}

- (IBAction)btnCalcelShareSender:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
