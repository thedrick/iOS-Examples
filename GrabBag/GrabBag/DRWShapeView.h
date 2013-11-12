//
//  DRWShapeView.h
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRWShapeView : UIView

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokeColor;

- (instancetype)initWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor;

@end
