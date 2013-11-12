//
//  DRWPinchViewController.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWPinchViewController.h"
#import "DRWPinchView.h"

@interface DRWPinchViewController ()

@end

@implementation DRWPinchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Pinch";
  }
  return self;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
  if (event.subtype == UIEventSubtypeMotionShake) {
    [((DRWPinchView *)self.view) clearAll];
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)loadView
{
  self.view = [[DRWPinchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
