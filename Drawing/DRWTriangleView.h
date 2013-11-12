//
//  DRWTriangleView.h
//  Drawing
//
//  Created by Tyler Hedrick on 10/6/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "DRWShapeView.h"

@interface DRWTriangleView : DRWShapeView
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, assign) CGFloat lineWidth;
@end
