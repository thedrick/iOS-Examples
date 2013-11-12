//
//  CDDEntryTableViewController.m
//  CoreDataDiary
//
//  Created by Tyler Hedrick on 10/13/13.
//  Copyright (c) 2013 Tyler Hedrick. All rights reserved.
//

#import "CDDEntryTableViewController.h"
#import "REComposeViewController.h"
#import "CDDDiaryEntry.h"
#import "CDDDiaryEntryTableViewCell.h"
#import "CDDDiaryEntryDetailViewController.h"

@interface CDDEntryTableViewController () <REComposeViewControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation CDDEntryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithDiary:(CDDDiary *)diary
{
  if (self = [super initWithStyle:UITableViewStyleGrouped]) {
    self.diary = diary;
    self.debug = YES;
  }
  return self;
}

- (void)setupFetchedResultsController
{
  if (self.diary.managedObjectContext) {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CDDDiaryEntry"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES selector:@selector(compare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"diary = %@", self.diary];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.diary.managedObjectContext
                                                                          sectionNameKeyPath:@"weekday"
                                                                                   cacheName:nil];
  } else {
    self.fetchedResultsController = nil;
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = self.diary.title;
  UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                                      target:self
                                                                                      action:@selector(addEntry:)];
  self.navigationItem.rightBarButtonItem = rightBarButtonItem;
  [self.tableView registerClass:[CDDDiaryEntryTableViewCell class] forCellReuseIdentifier:@"DiaryEntryCell"];
  [self setupFetchedResultsController];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [self performFetch];
}

- (void)addEntry:(id)sender
{
  REComposeViewController *composer = [[REComposeViewController alloc] init];
  composer.title = @"New Entry";
  // composer.hasAttachment = YES;
  composer.delegate = self;
  composer.hasAttachment = YES;
  [composer presentFromRootViewController];
}

- (void)composeViewController:(REComposeViewController *)composeViewController
          didFinishWithResult:(REComposeResult)result
{
  [composeViewController dismissViewControllerAnimated:YES completion:nil];
  if (result == REComposeResultPosted) {
    NSDate *time = [NSDate date];
    NSString *content = composeViewController.text;
    CDDDiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"CDDDiaryEntry"
                                                         inManagedObjectContext:self.diary.managedObjectContext];
    entry.content = content;
    entry.date = time;
    entry.diary = self.diary;
    if (composeViewController.userUpdatedAttachment) {
      entry.photo = UIImagePNGRepresentation(composeViewController.attachmentImage);
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEEE MMM dd";
    NSString *weekday = [formatter stringFromDate:time];
    entry.weekday = weekday;
    formatter.dateFormat = @"hh:mma";
    entry.title = [formatter stringFromDate:time];
    self.diary.numberOfEntries = @(self.diary.numberOfEntries.integerValue + 1);
    [self.diary.managedObjectContext save:NULL];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"DiaryEntryCell";
  CDDDiaryEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
  if (!cell) {
    cell = [[CDDDiaryEntryTableViewCell alloc] init];
  }
  
  CDDDiaryEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  cell.textLabel.text = entry.content;
  cell.detailTextLabel.text = entry.title;
  if (entry.photo) {
    cell.imageView.image = [UIImage imageWithData:entry.photo];
  }
    
  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.diary.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
    self.diary.numberOfEntries = @(self.diary.numberOfEntries.integerValue - 1);
    [self.diary.managedObjectContext save:NULL];
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  CDDDiaryEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  CDDDiaryEntryDetailViewController *entryDetailVC = [[CDDDiaryEntryDetailViewController alloc] initWithNibName:@"CDDDiaryEntryDetailViewController" bundle:nil];
  entryDetailVC.diaryEntry = entry;
  [self.navigationController pushViewController:entryDetailVC animated:YES];
}

@end
