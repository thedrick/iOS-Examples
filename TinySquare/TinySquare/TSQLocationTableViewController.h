//
//  TSQLocationTableViewController.h
//  TinySquare
//
//  Created by Tyler Hedrick on 8/30/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLLocation;
@class TSQLocation;

@protocol TSQLocationDelegate <NSObject>

- (void)userDidSelectLocation:(TSQLocation *)location;

@end

@interface TSQLocationTableViewController : UITableViewController

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) id<TSQLocationDelegate> delegate;

- (instancetype)initWithLocation:(CLLocation *)location;

@end
