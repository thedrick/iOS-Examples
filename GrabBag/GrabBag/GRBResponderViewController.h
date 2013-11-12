//
//  GRBResponderViewController.h
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRBResponderViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@end
