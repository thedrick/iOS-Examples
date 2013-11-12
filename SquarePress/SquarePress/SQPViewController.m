//
//  SQPViewController.m
//  SquarePress
//
//  Created by Tyler Hedrick on 9/18/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "SQPViewController.h"

@interface SQPViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) UIView *squareView;
@end

@implementation SQPViewController

- (void)loadView
{
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
  scrollView.contentSize = CGSizeMake(CGRectGetWidth(screenRect) * 2,
                                      CGRectGetHeight(screenRect) * 2);
  scrollView.backgroundColor = [UIColor whiteColor];
  scrollView.maximumZoomScale = 5.0;
  scrollView.minimumZoomScale = 0.5; // maximum scale takes up the whole screen
  scrollView.delegate = self;
  
  // Create a view as large as the scrollView's content size
  self.squareView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(scrollView.bounds),
                                                             CGRectGetMinY(scrollView.bounds),
                                                             scrollView.contentSize.width,
                                                             scrollView.contentSize.height)];
  self.squareView.backgroundColor = [UIColor whiteColor];
  [scrollView addSubview:self.squareView];
  self.view = scrollView;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
  return self.squareView;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(tappedScreen:)];
  [self.view addGestureRecognizer:tapRecognizer];
  
  self.colors = @[[UIColor redColor],
                  [UIColor orangeColor],
                  [UIColor yellowColor],
                  [UIColor greenColor],
                  [UIColor blueColor],
                  [UIColor purpleColor]];
}

- (void)tappedScreen:(UITapGestureRecognizer *)tapRecognizer
{
  if (tapRecognizer.state == UIGestureRecognizerStateEnded) {
    CGPoint tapPoint = [tapRecognizer locationInView:self.view];
    // offset by half the size to make the middle of the view appear where we tap.
    CGSize viewSize = CGSizeMake(50, 50);
    UIScrollView *scrollView = (UIScrollView *)self.view;
    CGFloat zoomScale = scrollView.zoomScale;
    CGPoint middle = CGPointMake((tapPoint.x / zoomScale) - viewSize.width / 2,
                                 (tapPoint.y / zoomScale) - viewSize.height / 2);
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(middle.x, middle.y,
                                                               viewSize.width, viewSize.height)];
    NSInteger idx = arc4random() % self.colors.count;
    subview.backgroundColor = self.colors[idx];
    [self.squareView addSubview:subview];
  }
}

@end
