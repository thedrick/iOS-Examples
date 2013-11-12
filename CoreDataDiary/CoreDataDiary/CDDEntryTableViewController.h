//
//  CDDEntryTableViewController.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/13/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDDCoreDataTableViewController.h"
#import "CDDDiary.h"

@interface CDDEntryTableViewController : CDDCoreDataTableViewController

@property (nonatomic, strong) CDDDiary *diary;

- (instancetype)initWithDiary:(CDDDiary *)diary;

@end
