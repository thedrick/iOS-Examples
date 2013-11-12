//
//  MEPFeedTableViewCell.m
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/15/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MEPFeedTableViewCell.h"
#import "MFPMediumPost.h"

@implementation MEPFeedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
    }
    return self;
}

- (void)setStory:(MFPMediumPost *)story
{
  _story = story;
  self.postTitle.font = [UIFont fontWithName:@"MyriadPro-Semibold" size:18];
  self.postTitle.text = story.title;
  self.postDescription.text = story.description;
  self.postCreator.text = story.author;
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateFormat = @"MMM dd, hh:mma";
  self.postDate.text = [formatter stringFromDate:story.publishDate];
}

@end
