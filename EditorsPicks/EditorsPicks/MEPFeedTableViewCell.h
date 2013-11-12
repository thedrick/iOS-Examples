//
//  MEPFeedTableViewCell.h
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/15/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MFPMediumPost;

@interface MEPFeedTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *postTitle;
@property (strong, nonatomic) IBOutlet UILabel *postDescription;
@property (strong, nonatomic) IBOutlet UILabel *postDate;
@property (strong, nonatomic) IBOutlet UILabel *postCreator;
@property (strong, nonatomic) MFPMediumPost *story;
@end
