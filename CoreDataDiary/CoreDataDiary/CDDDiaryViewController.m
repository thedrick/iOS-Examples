//
//  CDDDiaryViewController.m
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/14/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "CDDDiaryViewController.h"
#import "CDDDiary.h"
#import "CDDEntryTableViewController.h"

static const NSInteger kButtonIndexCancel = 0;
static const NSInteger kButtonIndexAdd = 1;

@interface CDDDiaryViewController () <UIAlertViewDelegate>

@end

@implementation CDDDiaryViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Diaries";
  UIBarButtonItem *addDiaryButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                  target:self
                                                                                  action:@selector(addDiary:)];
  self.navigationItem.rightBarButtonItem = addDiaryButton;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DiaryCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
  self.debug = YES;
  [super viewWillAppear:animated];
}

- (void)addDiary:(id)sender
{
  UIAlertView *createAlert = [[UIAlertView alloc] initWithTitle:@"Add Diary"
                                                        message:@"Enter a title for the diary:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Add", nil];
  createAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
  [createAlert show];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  if (buttonIndex == kButtonIndexAdd) {
    NSString *diaryTitle = [alertView textFieldAtIndex:0].text;
    if (diaryTitle.length == 0) {
      NSLog(@"Diary titles cannot be blank.");
      return;
    }
    CDDDiary *diary = [NSEntityDescription insertNewObjectForEntityForName:@"CDDDiary"
                                                    inManagedObjectContext:self.managedObjectContext];
    diary.title = diaryTitle;
    [self.managedObjectContext save:NULL];
  }
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
  _managedObjectContext = managedObjectContext;
  if (managedObjectContext) {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CDDDiary"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = nil;
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
  } else {
    self.fetchedResultsController = nil;
  }
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"DiaryCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  CDDDiary *diary = [self.fetchedResultsController objectAtIndexPath:indexPath];
  cell.textLabel.text = diary.title;
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  NSLog(@"diary is %@", diary);
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  CDDDiary *diary = [self.fetchedResultsController objectAtIndexPath:indexPath];
  CDDEntryTableViewController *entryTVC = [[CDDEntryTableViewController alloc] initWithDiary:diary];
  [self.navigationController pushViewController:entryTVC animated:YES];
}

@end
