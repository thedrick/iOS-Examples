//
//  GRBAttributedStringViewController.m
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "GRBAttributedStringViewController.h"

@interface GRBAttributedStringViewController () <UITextViewDelegate>

@end

@implementation GRBAttributedStringViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.textView.delegate = self;
}

- (void)textViewDidChange:(UITextView *)textView
{
  NSString *text = self.textView.text;
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
  [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.0] range:(NSRange){0, text.length}];
  UIColor *mentionColor = [UIColor colorWithRed:24.0/255.0 green:106.0/255.0 blue:186.0/255.0 alpha:0.3];
  UIColor *hashtagColor = [UIColor colorWithRed:24.0/255.0 green:186.0/255.0 blue:64.0/255.0 alpha:0.3];
  NSError *error = nil;
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[#@](\\w+)" options:0 error:&error];
  NSArray *matches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
  for (NSTextCheckingResult *match in matches) {
    NSRange wordRange = [match rangeAtIndex:0];
    NSString *word = [text substringWithRange:wordRange];
    [attributedString addAttribute:NSBackgroundColorAttributeName
                             value:[word hasPrefix:@"#"] ? hashtagColor : mentionColor
                             range:wordRange];
  }
  self.textView.attributedText = attributedString;
}

@end
