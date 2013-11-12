//
//  CDDDiaryEntry.h
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDDDiary;

@interface CDDDiaryEntry : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * weekday;
@property (nonatomic, retain) CDDDiary *diary;

@end
