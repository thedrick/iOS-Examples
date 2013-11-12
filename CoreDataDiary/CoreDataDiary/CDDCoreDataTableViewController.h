//
//  CDDCoreDataTableViewController.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property BOOL debug;

// refresh the results and force the controller to re-fetch
- (void)performFetch;
@end
