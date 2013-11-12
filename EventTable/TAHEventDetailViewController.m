//
//  TAHEventDetailViewController.m
//  EventTable
//
//  Created by Tyler Hedrick on 9/9/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "TAHEventDetailViewController.h"

@interface TAHEventDetailViewController ()

@end

@implementation TAHEventDetailViewController

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
    // Do any additional setup after loading the view from its nib.
  if (self.eventTitleString) {
    self.eventTitle.text = self.eventTitleString;
    self.title = self.eventTitleString;
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEventTitleString:(NSString *)eventTitleString
{
  _eventTitleString = eventTitleString;
  self.eventTitle.text = eventTitleString;
}

@end
