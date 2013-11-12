//
//  TSQFirstViewController.m
//  TinySquare
//
//  Created by Tyler Hedrick on 8/30/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "TSQLocation.h"
#import "TSQCheckinViewController.h"
#import "TSQLocationTableViewController.h"
#import "TSQUtilities.h"
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

@interface TSQCheckinViewController () <CLLocationManagerDelegate,
                                        PFLogInViewControllerDelegate,
                                        PFSignUpViewControllerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation TSQCheckinViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"Check In";
    self.locationManager = [[CLLocationManager alloc] init];
    // set the accuracy to best since we only poll when a user clicks "Check in"
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [TSQUtilities setLabelToLocationOfLoggedInUser:self.recentCheckin];
}

- (void)viewDidAppear:(BOOL)animated
{
  if (![PFUser currentUser]) { // No user logged in
    // Create the log in view controller
    PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
    [logInViewController setDelegate:self]; // Set ourselves as the delegate
    
    // Create the sign up view controller
    PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
    [signUpViewController setDelegate:self]; // Set ourselves as the delegate
    
    // Assign our sign up controller to be displayed from the login controller
    [logInViewController setSignUpController:signUpViewController];
    
    // Present the log in view controller
    [self presentViewController:logInViewController animated:NO completion:nil];
  }
}

#pragma mark -
#pragma mark PFLoginViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController
shouldBeginLogInWithUsername:(NSString *)username
                   password:(NSString *)password
{
  // Check if both fields are completed
  if (username && password && username.length != 0 && password.length != 0) {
    return YES; // Begin login process
  }
  
  [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                              message:@"Make sure you fill out all of the information!"
                             delegate:nil
                    cancelButtonTitle:@"ok"
                    otherButtonTitles:nil] show];
  return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark PFSignUpViewControllerDelegate
// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController
           shouldBeginSignUp:(NSDictionary *)info
{
  BOOL informationComplete = YES;
  
  // loop through all of the submitted data
  for (id key in info) {
    NSString *field = [info objectForKey:key];
    if (!field || field.length == 0) { // check completion
      informationComplete = NO;
      break;
    }
  }
  
  // Display an alert if a field wasn't completed
  if (!informationComplete) {
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
  }
  
  return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
  [self dismissViewControllerAnimated:YES completion:nil]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error
{
  NSLog(@"Failed to sign up...");
}

#pragma mark -
#pragma mark unimplemented methods

- (IBAction)checkin:(id)sender
{
  [self.locationManager startUpdatingLocation];
}

- (void)displayTableForLocation:(CLLocation *)location
{
  [self.locationManager stopUpdatingLocation];
  TSQLocationTableViewController *locationTableView = [[TSQLocationTableViewController alloc] initWithLocation:location];
  locationTableView.delegate = self;
  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:locationTableView];
  [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"Failed to find location"
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles:nil, nil];
  [alert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
  if (locations.count) {
    [self displayTableForLocation:locations[0]];
  }
}

#pragma mark TSQLocationDelegate

- (void)userDidSelectLocation:(TSQLocation *)location
{
  self.recentCheckin.text = location.name;
  [TSQUtilities logNewLocationForCurrentUser:location.name];
}

@end
