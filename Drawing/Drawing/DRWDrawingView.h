//
//  DRWDrawingView.h
//  Drawing
//
//  Created by Tyler Hedrick on 10/5/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRWDrawingView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *paths;
@property (nonatomic, strong) NSMutableArray *pathColors;

- (void)clearAll;
@end
