//
//  CDDAppDelegate.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/13/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
