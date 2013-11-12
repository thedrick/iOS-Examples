//
//  GRBCameraViewController.m
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "GRBCameraViewController.h"

@interface GRBCameraViewController ()

@end

@implementation GRBCameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)presentImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
  UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
  imagePickerController.delegate = self;
  imagePickerController.sourceType = sourceType;
  imagePickerController.allowsEditing = YES;
  [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)pickPhoto:(UIButton *)sender
{
  // If the device does not have a camera, there is no reason to give the user an option.
  if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    [self presentImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    return;
  }
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Photo Picker"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"Photo Library", @"Take Photo", nil];
  [actionSheet showInView:self.view];
}

#pragma mark -
#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
  // do nothing if the user cancels
  if (buttonIndex == actionSheet.cancelButtonIndex) {
    return;
  }
  [self presentImagePickerForSourceType:(buttonIndex == 0) ? UIImagePickerControllerSourceTypePhotoLibrary :
   UIImagePickerControllerSourceTypeCamera];
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
  // no-op
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  self.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
