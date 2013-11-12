//
//  CDDDiaryViewController.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDDCoreDataTableViewController.h"

@interface CDDDiaryViewController : CDDCoreDataTableViewController
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
