//
//  MEPFeedTableViewController.m
//  EditorsPicks
//
//  Created by Tyler Hedrick on 9/15/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MEPFeedTableViewController.h"
#import "MEPFeedTableViewCell.h"
#import "MFPMediumUtility.h"
#import "MEPWebViewController.h"

static NSString * const cellIdentifier = @"MEPFeedTableViewCell";

@interface MEPFeedTableViewController () 
@property (nonatomic, strong) NSArray *feedStories;
@end

@implementation MEPFeedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
  
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerNib:[UINib nibWithNibName:@"MEPFeedTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
  self.title = @"Editor's Picks";
  [self loadStories];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.feedStories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MEPFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  cell.story = [self.feedStories objectAtIndex:indexPath.row];
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateStyle = NSDateFormatterMediumStyle;
  formatter.timeStyle = NSDateFormatterShortStyle;
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 130.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MFPMediumPost *story = [self.feedStories objectAtIndex:indexPath.row];
  NSURL *url = [NSURL URLWithString:story.URLString];
  MEPWebViewController *webViewController = [[MEPWebViewController alloc] init];
  [self.navigationController pushViewController:webViewController animated:YES];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webViewController.webView loadRequest:request];
  webViewController.navigationItem.title = story.title;
}
#pragma mark - NSXMLParserDelegate

- (void)loadStories
{
  [MFPMediumUtility findPostsForCollection:@"editors-picks"
                           completionBlock:^(NSArray *posts, NSError *error) {
                             self.feedStories = posts;
                             [self.tableView reloadData];
                           }];
}


@end
