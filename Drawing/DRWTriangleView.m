//
//  DRWTriangleView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWTriangleView.h"

@interface DRWTriangleView ()

@end

@implementation DRWTriangleView

- (instancetype)initWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor
{
  if (self = [super initWithStrokeColor:strokeColor fillColor:fillColor]) {
    self.path = [[UIBezierPath alloc] init];
    self.lineWidth = 1.0;
  }
  return self;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  _lineWidth = lineWidth;
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
  [self.fillColor setFill];
  [self.strokeColor setStroke];
  // inset to include stroke
  CGRect triangleRect = CGRectInset(self.bounds, self.lineWidth / 2.0, self.lineWidth / 2.0);
  CGPoint bottomLeft = CGPointMake(CGRectGetMinX(triangleRect),
                                   CGRectGetMaxY(triangleRect));
  CGPoint bottomRight = CGPointMake(CGRectGetMaxX(triangleRect),
                                    CGRectGetMaxY(triangleRect));
  CGPoint topPoint = CGPointMake(CGRectGetMidX(triangleRect),
                                 CGRectGetMinY(triangleRect));
  UIBezierPath *trianglePath = [UIBezierPath bezierPath];
  trianglePath.lineWidth = self.lineWidth;
  [trianglePath moveToPoint:bottomLeft];
  [trianglePath addLineToPoint:topPoint];
  [trianglePath addLineToPoint:bottomRight];
  [trianglePath closePath];
  [trianglePath stroke];
  [trianglePath fill];
  self.path = trianglePath;
}


@end
