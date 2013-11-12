//
//  GRBCameraViewController.h
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRBCameraViewController : UIViewController <UINavigationControllerDelegate,
                                                       UIImagePickerControllerDelegate,
                                                       UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)pickPhoto:(UIButton *)sender;

@end
