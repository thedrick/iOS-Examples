//
//  MSVViewController.m
//  MinionScrollView
//
//  Created by Tyler Hedrick on 9/19/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MSVViewController.h"

@interface MSVViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation MSVViewController

- (void)loadView
{
  self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minions.jpg"]];
  
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
  scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.imageView.bounds),
                                      CGRectGetHeight(self.imageView.bounds));
  scrollView.backgroundColor = [UIColor blackColor];
  scrollView.minimumZoomScale = 1.0;
  scrollView.maximumZoomScale = 1.0;
  scrollView.delegate = self;
  
  // Create a view as large as the scrollView's content size
  [scrollView addSubview:self.imageView];
  self.view = scrollView;
}

// iOS 7 specific - sets the status bar to white
- (UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
  NSLog(@"Beginning contentOffset is %@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  NSLog(@"Ending contentOffset is %@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
  if (!decelerate) {
    NSLog(@"Ending contentOffset is %@", NSStringFromCGPoint(scrollView.contentOffset));
  }
}

@end
