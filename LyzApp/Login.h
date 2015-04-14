//
//  ViewController.h
//  LyzApp
//
//  Created by Galileo Guzman on 13/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)btnLogin:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnLoginWithFb;
@end

