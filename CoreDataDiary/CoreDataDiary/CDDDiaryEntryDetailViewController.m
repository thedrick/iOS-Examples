//
//  CDDDiaryEntryDetailViewController.m
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "CDDDiaryEntryDetailViewController.h"
#import "CDDDiaryEntry.h"

@interface CDDDiaryEntryDetailViewController ()

@end

@implementation CDDDiaryEntryDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDiaryEntry:(CDDDiaryEntry *)diaryEntry
{
  _diaryEntry = diaryEntry;
  self.textView.text = diaryEntry.content;
  self.imageView.image = [UIImage imageWithData:diaryEntry.photo];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(saveEntry:)];
  self.navigationItem.rightBarButtonItem = saveButton;
  self.textView.text = self.diaryEntry.content;
  self.imageView.image = [UIImage imageWithData:self.diaryEntry.photo];
}

- (void)saveEntry:(id)sender
{
  self.diaryEntry.content = self.textView.text;
  [self.diaryEntry.managedObjectContext save:NULL];
}

@end
