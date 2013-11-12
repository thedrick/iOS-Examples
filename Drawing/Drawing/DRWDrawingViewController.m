//
//  DRWDrawingViewController.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/5/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWDrawingViewController.h"
#import "DRWDrawingView.h"
#import "DRWColorPicker.h"

@interface DRWDrawingViewController ()
@end

@implementation DRWDrawingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Drawing";
  }
  return self;
}

- (void)loadView
{
  self.view = [[DRWDrawingView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
  [((DRWDrawingView *)self.view) clearAll];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
