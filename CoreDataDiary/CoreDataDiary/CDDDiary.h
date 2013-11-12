//
//  CDDDiary.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDDDiaryEntry;

@interface CDDDiary : NSManagedObject

@property (nonatomic, retain) NSNumber * numberOfEntries;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSOrderedSet *entries;
@end

@interface CDDDiary (CoreDataGeneratedAccessors)

- (void)insertObject:(CDDDiaryEntry *)value inEntriesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEntriesAtIndex:(NSUInteger)idx;
- (void)insertEntries:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEntriesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEntriesAtIndex:(NSUInteger)idx withObject:(CDDDiaryEntry *)value;
- (void)replaceEntriesAtIndexes:(NSIndexSet *)indexes withEntries:(NSArray *)values;
- (void)addEntriesObject:(CDDDiaryEntry *)value;
- (void)removeEntriesObject:(CDDDiaryEntry *)value;
- (void)addEntries:(NSOrderedSet *)values;
- (void)removeEntries:(NSOrderedSet *)values;
@end
