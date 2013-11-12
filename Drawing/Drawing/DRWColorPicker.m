//
//  DRWColorPicker.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWColorPicker.h"
#import "DRWCircleView.h"

static const CGFloat kColorPickerHeight = 44.0;
static const CGFloat kColorPickerCircleRadius = 20;

@interface DRWColorPicker ()
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *circleViews;
@end

@implementation DRWColorPicker

- (id)initWithFrame:(CGRect)frame
{
  @throw [NSException exceptionWithName:@"Invalid initializer"
                                 reason:@"Use init instead"
                               userInfo:nil];
}

- (id)init
{
  if (self = [super initWithFrame:CGRectZero]) {
    self.colors = @[[UIColor blackColor],
                    [UIColor redColor],
                    [UIColor orangeColor],
                    [UIColor yellowColor],
                    [UIColor greenColor],
                    [UIColor blueColor],
                    [UIColor purpleColor],
                    [UIColor whiteColor]];
    UIColor *strokeColor = [UIColor blackColor];
    NSMutableArray *colorCircleArray = [NSMutableArray array];
    for (UIColor *color in self.colors) {
      DRWCircleView *circle = [[DRWCircleView alloc] initWithStrokeColor:strokeColor fillColor:color];
      circle.radius = kColorPickerCircleRadius;
      [colorCircleArray addObject:circle];
      [self addSubview:circle];
    }
    self.circleViews = [colorCircleArray copy];
    colorCircleArray = nil;
  }
  return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (touches.count != 1) {
    return;
  }
  UITouch *touch = [touches anyObject];
  CGPoint point = [touch locationInView:self];
  for (NSInteger i = 0; i < self.circleViews.count; i++) {
    DRWCircleView *circle = [self.circleViews objectAtIndex:i];
    if (CGRectContainsPoint(circle.frame, point)) {
      [self.delegate colorPicker:self didChangeToColor:[self.colors objectAtIndex:i]];
      break;
    }
  }
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGFloat currentX = kColorPickerCircleRadius;
  CGFloat midY = CGRectGetMidY(self.frame);
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  for (DRWCircleView *circleView in self.circleViews) {
    circleView.center = CGPointMake(currentX, midY);
    currentX += (2 * kColorPickerCircleRadius);
  }
  CGRect frame = self.frame;
  frame.size = CGSizeMake(CGRectGetWidth(screenRect), kColorPickerHeight);
  self.frame = frame;
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
