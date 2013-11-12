//
//  MEPFeedStory.h
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/15/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEPFeedStory : NSObject
@property (nonatomic, strong) NSString *storyTitle;
@property (nonatomic, strong) NSString *storyDescription;
@property (nonatomic, strong) NSString *storyURL;
@property (nonatomic, strong) NSString *storyCreator;
@property (nonatomic, strong) NSDate *storyPublishDate;

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                          URL:(NSString *)url
                      creator:(NSString *)creator
                  publishDate:(NSDate *)publishDate;

@end
