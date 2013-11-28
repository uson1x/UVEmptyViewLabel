//
//  UVTableViewController.m
//  EmptyLabelSample
//
//  Created by Ivan Parfenchuk on 28.11.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "UVTableViewController.h"
#import "UIScrollView+EmptyViewLabel.h"

@interface UVTableViewController ()
@property (strong, nonatomic) NSMutableArray * cellDescriptions;
@end

@implementation UVTableViewController

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
    self.cellDescriptions = [@[@"Cell 0"] mutableCopy];
    [self.tableView addEmptyViewLabelWithText:@"Table view is empty"];
    self.tableView.emptyViewLabel.textColor = [UIColor darkGrayColor];
}

- (IBAction)addCell:(id)sender
{
    [self.cellDescriptions addObject:[NSString stringWithFormat:@"Cell %d", self.cellDescriptions.count]];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.cellDescriptions.count-1
                                                                inSection:0]]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self refreshEmptyLabelViewVisibility];
}

- (IBAction)deleteCell:(id)sender
{
    if (self.cellDescriptions.count) {
        [self.cellDescriptions removeLastObject];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.cellDescriptions.count
                                                                    inSection:0]]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
    [self refreshEmptyLabelViewVisibility];
}

- (void)refreshEmptyLabelViewVisibility
{
    self.tableView.showsEmptyViewLabel = !self.cellDescriptions.count;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellDescriptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.cellDescriptions[indexPath.row];
    return cell;
}

@end
