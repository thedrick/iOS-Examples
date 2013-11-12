//
//  GRBResponderViewController.m
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "GRBResponderViewController.h"

@interface GRBResponderViewController ()

@end

@implementation GRBResponderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.textField.keyboardType = UIKeyboardTypeDefault;
  self.textField.delegate = self;
  // Subscribe to a notification of the keyboard coming up.
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(tap:)];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldDidChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:nil];
  [self.view addGestureRecognizer:tapRecognizer];
  self.notificationLabel.text = @"Keyboard hidden";
}

#pragma mark -
#pragma UITapGestureRecognizer

- (void)tap:(UITapGestureRecognizer *)tapRecognizer
{
  // resigning first responder will dismiss the keyboard automatically.
  [self.textField resignFirstResponder];
}

#pragma mark -
#pragma mark NSNotification

- (void)keyboardWillShow:(NSNotification *)notification
{
  NSLog(@"Notification for will show: %@", notification);
  self.notificationLabel.text = @"Keyboard showing";
}

- (void)keyboardWillHide:(NSNotification *)notification
{
  NSLog(@"Notification for will hide: %@", notification);
  self.notificationLabel.text = @"Keyboard hidden";
}

- (void)textFieldDidChange:(NSNotification *)notification
{
  NSRange rangeOfTyler = [self.textField.text rangeOfString:@"tyler" options:NSCaseInsensitiveSearch];
  if (rangeOfTyler.length != 0) {
    self.notificationLabel.text = @"Tyler is in the text!";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.textField.text];
    UIColor *lightBlue = [UIColor colorWithRed:24.0/255.0 green:106.0/255.0 blue:186.0/255.0 alpha:0.3];
    [attributedString addAttribute:NSBackgroundColorAttributeName value:lightBlue range:rangeOfTyler];
    self.textField.attributedText = attributedString;
  } else {
    self.notificationLabel.text = @"Tyler is not in the text :(";
  }
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [self.textField resignFirstResponder];
  return YES;
}

@end
