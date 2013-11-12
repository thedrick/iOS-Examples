//
//  CDDDiaryEntryDetailViewController.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDDDiaryEntry;

@interface CDDDiaryEntryDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) CDDDiaryEntry *diaryEntry;

@end
