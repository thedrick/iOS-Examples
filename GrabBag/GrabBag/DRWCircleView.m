//
//  DRWCircleView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWCircleView.h"

@implementation DRWCircleView

- (id)initWithFrame:(CGRect)frame
{
  return [self initWithStrokeColor:[UIColor blackColor] fillColor:[UIColor blackColor]];
}

- (instancetype)initWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor
{
  if (self = [super initWithStrokeColor:strokeColor fillColor:fillColor]) {
    self.radius = 10.0;
  }
  return self;
}

- (void)setRadius:(CGFloat)radius
{
  _radius = radius;
  CGRect bounds = self.bounds;
  bounds.size = CGSizeMake(radius * 2, radius * 2);
  self.bounds = bounds;
  [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  UIBezierPath *bezierPath = [UIBezierPath bezierPath];
  bezierPath.lineWidth = 1.0;
  CGRect rectForCircle = CGRectInset(self.bounds,
                                     bezierPath.lineWidth / 2.0,
                                     bezierPath.lineWidth / 2.0);
  CGPoint center = CGPointMake(CGRectGetMidX(rectForCircle),
                               CGRectGetMidY(rectForCircle));
  CGFloat radius = CGRectGetWidth(rectForCircle) / 2.0;
  [bezierPath addArcWithCenter:center
                        radius:radius
                    startAngle:0
                      endAngle:(2 * M_PI)
                     clockwise:YES];
  [self.strokeColor setStroke];
  [self.fillColor setFill];
  [bezierPath stroke];
  [bezierPath fill];
}


@end
