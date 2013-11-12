//
//  DRWShapeView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWShapeView.h"

@implementation DRWShapeView

- (id)initWithFrame:(CGRect)frame
{
  return [self initWithStrokeColor:[UIColor blackColor] fillColor:[UIColor blackColor]];
}

- (instancetype)initWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor
{
  if (self = [super initWithFrame:CGRectZero]) {
    self.backgroundColor = [UIColor clearColor];
    self.strokeColor = strokeColor;
    self.fillColor = fillColor;
  }
  return self;
}

- (void)setFillColor:(UIColor *)fillColor
{
  _fillColor = fillColor;
  [self setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  _strokeColor = strokeColor;
  [self setNeedsDisplay];
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
