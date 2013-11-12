//
//  MEPWebViewController.m
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/16/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MEPWebViewController.h"

@interface MEPWebViewController ()

@end

@implementation MEPWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)loadView
{
  CGRect mainScreen = [[UIScreen mainScreen] applicationFrame];
  UIWebView *webView = [[UIWebView alloc] initWithFrame:mainScreen];
  webView.scalesPageToFit = YES;
  [self setView:webView];
}

- (UIWebView *)webView
{
  return (UIWebView *)self.view;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

@end
