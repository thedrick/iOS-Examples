//
//  TAHEventCell.h
//  EventTable
//
//  Created by Tyler Hedrick on 9/9/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAHEventCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *host;
@property (strong, nonatomic) IBOutlet UILabel *date;

@end
