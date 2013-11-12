//
//  DRWColorPicker.h
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DRWColorPickerDelegate;

@interface DRWColorPicker : UIView
@property (nonatomic, weak) id<DRWColorPickerDelegate> delegate;
@end

@protocol DRWColorPickerDelegate <NSObject>

- (void)colorPicker:(DRWColorPicker *)colorPicker didChangeToColor:(UIColor *)color;

@end
