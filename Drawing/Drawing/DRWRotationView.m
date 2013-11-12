//
//  DRWRotationView.m
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWRotationView.h"
#import "DRWTriangleView.h"
#import "DRWSmileView.h"

@interface DRWRotationView ()

@property (nonatomic, strong) DRWTriangleView *selectedTriangleView;
@property (nonatomic, strong) NSMutableArray *triangles;

@end

@implementation DRWRotationView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(userDidTap:)];
    [self addGestureRecognizer:tapRecognizer];
    self.triangles = [NSMutableArray array];
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                   action:@selector(rotate:)];
    [self addGestureRecognizer:rotationRecognizer];
  }
  return self;
}

- (void)rotate:(UIRotationGestureRecognizer *)rotationRecognizer
{
  self.selectedTriangleView.transform = CGAffineTransformRotate(self.selectedTriangleView.transform,
                                                                rotationRecognizer.rotation * 2);
  rotationRecognizer.rotation = 0;
  
}

- (void)userDidTap:(UITapGestureRecognizer *)tapRecognizer
{
  CGPoint point = [tapRecognizer locationInView:self];
  for (DRWTriangleView *triangleView in [self.triangles reverseObjectEnumerator]) {
    if ([triangleView.path containsPoint:[self convertPoint:point toView:triangleView]]) {
      self.selectedTriangleView.strokeColor = [UIColor blackColor];
      self.selectedTriangleView.lineWidth = 1.0;
      self.selectedTriangleView = triangleView;
      self.selectedTriangleView.strokeColor = [UIColor blueColor];
      self.selectedTriangleView.lineWidth = 4.0;
      return;
    }
  }
  
  DRWSmileView *smileView = [[DRWSmileView alloc] initWithStrokeColor:[UIColor blackColor] fillColor:[UIColor yellowColor]];
  smileView.center = point;
  smileView.radius = 100.0;
  [self addSubview:smileView];
  return;

  DRWTriangleView *triangle = [[DRWTriangleView alloc] initWithStrokeColor:[UIColor blackColor] fillColor:[UIColor greenColor]];
  triangle.frame = (CGRect) {
    .origin = CGPointZero,
    .size = { .width = 80.0, .height = 80.0 }
  };
  triangle.center = point;
  [self addSubview:triangle];
  [self.triangles addObject:triangle];
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
