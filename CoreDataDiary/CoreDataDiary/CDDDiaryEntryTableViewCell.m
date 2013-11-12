//
//  CDDDiaryEntryTableViewCell.m
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "CDDDiaryEntryTableViewCell.h"

@implementation CDDDiaryEntryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}

- (id)init
{
  return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DiaryEntryCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  
}

@end
