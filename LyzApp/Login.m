//
//  ViewController.m
//  LyzApp
//
//  Created by Galileo Guzman on 13/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Login.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "CRMotionView.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //CRMotion Setup
    CRMotionView *motionView = [self motionViewWithImage];
    
    [motionView setScrollDragEnabled:YES];
    [motionView setScrollBounceEnabled:NO];
    
    [motionView addSubview:[self btnLoginWithFb]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self _startApplicationWithUser:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
            } else {
                NSLog(@"User with facebook logged in!");
            }
            [self _startApplicationWithUser:YES];
        }
    }];
    
    [_activityIndicator startAnimating]; // Show loading indicator until login is finished
    
}

- (void)_startApplicationWithUser:(BOOL)animated {
    [self performSegueWithIdentifier:@"GoToDetails" sender:self];
}

- (CRMotionView *)motionViewWithImage
{
    NSArray *images_parallax = @[@"grancanon.jpg", @"paris.png", @"times-square.jpg", @"Image.png"];
    int random_image = arc4random_uniform(4);
    
    CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.view.bounds];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:images_parallax[random_image]]];
    [motionView setContentView:imageView];
    [self.view addSubview:motionView];
    return motionView;
}
@end
