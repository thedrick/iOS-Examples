//
//  DRWSmileView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/7/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWSmileView.h"



@implementation DRWSmileView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
      // Initialization code
  }
  return self;
}

- (UIBezierPath *)pathForCirlceWithCenter:(CGPoint)center radius:(CGFloat)radius
{
  UIBezierPath *path = [UIBezierPath bezierPath];
  [path addArcWithCenter:center radius:radius startAngle:0 endAngle:(2 * M_PI) clockwise:YES];
  return path;
}

- (void)setRadius:(CGFloat)radius
{
  _radius = radius;
  CGRect bounds = self.bounds;
  bounds.size = CGSizeMake(radius * 2, radius * 2);
  self.bounds = bounds;
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
  [self.strokeColor setStroke];
  [self.fillColor setFill];
  CGRect smileRect = self.bounds;
  CGPoint midpoint = CGPointMake(CGRectGetMidX(smileRect), CGRectGetMidY(smileRect));
  
  CGPoint leftEyePoint = (CGPoint) {
    .x = midpoint.x - (self.radius * 0.35),
    .y = midpoint.y - (self.radius * 0.35)
  };
  CGPoint rightEyePoint = (CGPoint) {
    .x = midpoint.x + (self.radius * 0.35),
    .y = midpoint.y - (self.radius * 0.35)
  };
  UIBezierPath *faceCircle = [self pathForCirlceWithCenter:midpoint radius:(self.radius * 0.95)];
  [faceCircle stroke];
  [faceCircle fill];
  // fill the eyes in with the same color as the stroke
  [self.strokeColor setFill];
  UIBezierPath *leftEye = [self pathForCirlceWithCenter:leftEyePoint radius:(self.radius * 0.10)];
  [leftEye stroke];
  [leftEye fill];
  UIBezierPath *rightEye = [self pathForCirlceWithCenter:rightEyePoint radius:(self.radius * 0.10)];
  [rightEye stroke];
  [rightEye fill];
  
  CGPoint smileLeft = (CGPoint) {
    .x = midpoint.x - (self.radius * 0.45),
    .y = midpoint.y + (self.radius * 0.25)
  };
  CGPoint smileRight = (CGPoint) {
    .x = midpoint.x + (self.radius * 0.45),
    .y = midpoint.y + (self.radius * 0.25)
  };
  CGPoint smileMiddle = (CGPoint) {
    .x = midpoint.x,
    .y = midpoint.y + (self.radius * 0.65)
  };
  CGPoint smileLeftControlPoint = smileMiddle;
  smileLeftControlPoint.x -= self.radius * 0.40;
  CGPoint smileRightControlPoint = smileMiddle;
  smileRightControlPoint.x += self.radius * 0.40;
  UIBezierPath *smilePath = [UIBezierPath bezierPath];
  smilePath.lineCapStyle = kCGLineCapRound;
  smilePath.lineWidth = 5.0;
  [smilePath moveToPoint:smileLeft];
  [smilePath addCurveToPoint:smileRight controlPoint1:smileLeftControlPoint controlPoint2:smileRightControlPoint];
  [smilePath stroke];
}

@end
