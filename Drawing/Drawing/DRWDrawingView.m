//
//  DRWDrawingView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/5/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWDrawingView.h"
#import "DRWColorPicker.h"

@interface DRWDrawingView () <DRWColorPickerDelegate>
@property (nonatomic, strong) UIBezierPath *currentPath;
@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, strong) DRWColorPicker *colorPicker;
@end

@implementation DRWDrawingView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    self.paths = [NSMutableArray array];
    self.pathColors = [NSMutableArray array];
    self.colorPicker = [[DRWColorPicker alloc] init];
    self.colorPicker.delegate = self;
    self.currentColor = [UIColor blackColor];
    [self addSubview:self.colorPicker];
  }
  return self;
}

- (void)colorPicker:(DRWColorPicker *)colorPicker didChangeToColor:(UIColor *)color
{
  self.currentColor = color;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (touches.count == 1) {
    UITouch *touch = [touches anyObject];
    
    if (CGRectContainsPoint(self.colorPicker.frame, [touch locationInView:self])) {
      [self.colorPicker touchesBegan:touches withEvent:event];
      return;
    }
    
    self.currentPath = [[UIBezierPath alloc] init];
    self.currentPath.lineCapStyle = kCGLineCapRound;
    [self.currentPath moveToPoint:[touch locationInView:self]];
  }
  self.currentPath.lineWidth = 5.0;
  [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (touches.count != 1) {
    return;
  }
  for (UITouch *touch in touches) {
    [self.currentPath addLineToPoint:[touch locationInView:self]];
  }
  [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  for (UITouch *touch in touches) {
    [self.currentPath addLineToPoint:[touch locationInView:self]];
  }
  [self.paths addObject:self.currentPath];
  [self.pathColors addObject:self.currentColor];
  self.currentPath = nil;
  
  [self setNeedsDisplay];
}

- (void)clearAll
{
  [self.paths removeAllObjects];
  [self.pathColors removeAllObjects];
  self.currentPath = nil;
  [self setNeedsDisplay];
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineCap(context, kCGLineCapButt);
  for (NSInteger i = 0; i < self.paths.count; i++) {
    UIColor *pathColor = [self.pathColors objectAtIndex:i];
    UIBezierPath *path = [self.paths objectAtIndex:i];
    [pathColor setStroke];
    [path stroke];
  }
  CGContextSetStrokeColorWithColor(context, [self.currentColor CGColor]);
  [self.currentPath stroke];
}


@end
