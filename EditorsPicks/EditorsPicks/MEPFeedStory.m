//
//  MEPFeedStory.m
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/15/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MEPFeedStory.h"

@implementation MEPFeedStory

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                          URL:(NSString *)url
                      creator:(NSString *)creator
                  publishDate:(NSDate *)publishDate
{
  if (self = [super init]) {
    self.storyTitle = title;
    self.storyDescription = desc;
    self.storyURL = url;
    self.storyCreator = creator;
    self.storyPublishDate = publishDate;
  }
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@, Title: %@, Description: %@, URL: %@, Creator: %@, Published: %@",
          [super description],
          self.storyTitle,
          self.storyDescription,
          self.storyURL,
          self.storyCreator,
          self.storyPublishDate];
}

@end
