//
//  GRBAccelerometerViewController.m
//  GrabBag
//
//  Created by Tyler Hedrick on 11/11/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "GRBAccelerometerViewController.h"
#import "DRWCircleView.h"
#import <CoreMotion/CoreMotion.h>

@interface GRBAccelerometerViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation GRBAccelerometerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.motionManager = [[CMMotionManager alloc] init];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
  self.movingView = [[DRWCircleView alloc] initWithStrokeColor:[UIColor blueColor] fillColor:[UIColor blueColor]];
  self.movingView.radius = 30.0;
  [self.view addSubview:self.movingView];
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  CGPoint screenCenter = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect));
  self.movingView.center = screenCenter;
}

- (void)viewDidAppear:(BOOL)animated
{
  [self startDetectingMotion];
}

- (void)startDetectingMotion
{
  CGFloat stepSize = 5.0;
  NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
  [self.motionManager
   startAccelerometerUpdatesToQueue:operationQueue
                        withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                          dispatch_async(dispatch_get_main_queue(), ^{
                            CGPoint center = self.movingView.center;
                            center.x += accelerometerData.acceleration.x * stepSize;
                            center.y -= accelerometerData.acceleration.y * stepSize;
                            if ((center.y < (0 - CGRectGetMidY(self.movingView.bounds))) ||
                                (center.y > (CGRectGetHeight(self.view.frame) - CGRectGetMidY(self.movingView.bounds)))) {
                              center.y = self.movingView.center.y;
                            }
                            if ((center.x < (CGRectGetMidX(self.movingView.bounds))) ||
                                (center.x > (CGRectGetWidth(self.view.frame) - CGRectGetMidX(self.movingView.bounds)))) {
                              center.x = self.movingView.center.x;
                            }
                            self.movingView.center = center;
                          });
                        }];
}

@end
