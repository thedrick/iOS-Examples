//
//  TAHEventDetailViewController.h
//  EventTable
//
//  Created by Tyler Hedrick on 9/9/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAHEventDetailViewController : UIViewController
@property (strong, nonatomic) NSString *eventTitleString;
@property (strong, nonatomic) IBOutlet UILabel *eventTitle;

@end
