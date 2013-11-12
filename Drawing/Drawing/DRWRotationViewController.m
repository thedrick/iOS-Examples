//
//  DRWRotationViewController.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWRotationViewController.h"
#import "DRWRotationView.h"

@interface DRWRotationViewController ()

@end

@implementation DRWRotationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Rotation";
  }
  return self;
}

- (void)loadView
{
  self.view = [[DRWRotationView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}



@end
