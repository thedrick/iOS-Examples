//
//  TAHEventTableViewController.m
//  EventTable
//
//  Created by Tyler Hedrick on 9/9/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "TAHEventTableViewController.h"
#import "TAHEventCell.h"
#import "TAHEventDetailViewController.h"

@interface TAHEventTableViewController ()
@property (nonatomic, strong) NSArray *events;
@end

@implementation TAHEventTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      [self.tableView registerNib:[UINib nibWithNibName:@"TAHEventCell" bundle:nil] forCellReuseIdentifier:@"eventCell"];
      self.events = @[@"Birthday Party", @"Zoo", @"Flyin to the moon", @"Woo hahooo"];
      self.title = @"Events";
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  NSMutableArray *eventArray = [self.events mutableCopy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.events.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 96.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TAHEventCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
  cell.title.text = [self.events objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  TAHEventDetailViewController *eventController = [[TAHEventDetailViewController alloc] initWithNibName:@"TAHEventDetailViewController" bundle:[NSBundle mainBundle]];
  eventController.eventTitleString = [self.events objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:eventController animated:YES];
}


@end
