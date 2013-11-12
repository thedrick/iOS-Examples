//
//  GRBMainViewController.m
//  GrabBag
//
//  Created by Tyler Hedrick on 11/10/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "GRBMainViewController.h"
#import "GRBCameraViewController.h"
#import "GRBResponderViewController.h"
#import "GRBAttributedStringViewController.h"
#import "GRBAccelerometerViewController.h"

static NSString * const cellIdentifier = @"tableViewCell";

@interface GRBMainViewController ()
@property (nonatomic, strong) NSArray *cellTitles;
@end

@implementation GRBMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    self.cellTitles = @[@"Camera",
                        @"UIResponder",
                        @"More Attributed Strings",
                        @"Accelerometer"];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  cell.textLabel.text = self.cellTitles[indexPath.row];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  UIViewController *viewController;
  if (indexPath.row == 0) {
    viewController = [[GRBCameraViewController alloc] init];
  } else if (indexPath.row == 1) {
    viewController = [[GRBResponderViewController alloc] init];
  } else if (indexPath.row == 2) {
    viewController = [[GRBAttributedStringViewController alloc] init];
  } else if (indexPath.row == 3) {
    viewController = [[GRBAccelerometerViewController alloc] init];
  }
  [self.navigationController pushViewController:viewController animated:YES];
}

@end
