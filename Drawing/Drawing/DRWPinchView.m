//
//  DRWPinchView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWPinchView.h"
#import "DRWCircleView.h"
#import "DRWColorPicker.h"

@interface DRWPinchView () <DRWColorPickerDelegate>
@property (nonatomic, strong) DRWColorPicker *colorPicker;
@property (nonatomic, strong) DRWCircleView *currentCircle;
@property (nonatomic, strong) NSMutableArray *circles;
@property (nonatomic, strong) NSMutableArray *circleColors;
@property (nonatomic, strong) UIColor *currentColor;
@end

@implementation DRWPinchView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(userDidPinch:)];
    [self addGestureRecognizer:pinchRecognizer];
    self.circles = [NSMutableArray array];
    self.circleColors = [NSMutableArray array];
    self.colorPicker = [[DRWColorPicker alloc] init];
    self.colorPicker.delegate = self;
    [self addSubview:self.colorPicker];
  }
  return self;
}

- (void)colorPicker:(DRWColorPicker *)colorPicker didChangeToColor:(UIColor *)color
{
  self.currentColor = color;
}

- (CGPoint)midpointForPoint1:(CGPoint)point1 point2:(CGPoint)point2
{
  return CGPointMake((point1.x + point2.x) / 2.0, (point1.y + point2.y) / 2.0);
}

float square(float x) {
  return x * x;
}

- (CGFloat)distanceBetweenPoint1:(CGPoint)point1 point2:(CGPoint)point2
{
  return sqrt(square(point1.x - point2.x) + square(point1.y - point2.y));
}

- (void)userDidPinch:(UIPinchGestureRecognizer *)pinchRecognizer
{
  if (pinchRecognizer.numberOfTouches != 2) {
    return;
  }
  CGPoint firstTouchPoint = [pinchRecognizer locationOfTouch:0 inView:self];
  CGPoint secondTouchPoint = [pinchRecognizer locationOfTouch:1 inView:self];
  if (pinchRecognizer.state == UIGestureRecognizerStateBegan) {
    if (self.currentCircle) {
      [self.circles addObject:self.currentCircle];
      self.currentCircle = nil;
    }
    self.currentCircle = [[DRWCircleView alloc] initWithFrame:CGRectZero];
    self.currentCircle.fillColor = self.currentColor;
    [self addSubview:self.currentCircle];
  }
  self.currentCircle.center = [self midpointForPoint1:firstTouchPoint point2:secondTouchPoint];
  self.currentCircle.radius = [self distanceBetweenPoint1:firstTouchPoint point2:secondTouchPoint] / 2.0;
  
  if (pinchRecognizer.state == UIGestureRecognizerStateEnded) {
    [self.circles addObject:self.currentCircle];
    self.currentCircle = nil;
  }
}

- (void)clearAll
{
  for (DRWCircleView *circle in self.circles) {
    [circle removeFromSuperview];
  }
  [self.currentCircle removeFromSuperview];
  [self.circles removeAllObjects];
  [self.circleColors removeAllObjects];
  self.currentCircle = nil;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect statusBarRect = [[UIApplication sharedApplication] statusBarFrame];
  CGRect colorPickerFrame = (CGRect) {
    .origin = { .x = 0, .y = CGRectGetMaxY(statusBarRect) },
    .size = self.colorPicker.bounds.size
  };
  self.colorPicker.frame = colorPickerFrame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
