UVEmptyViewLabel
================

Provides an easy way to display an empty UITableView/UICollectionView message.
If you have a lot of UITableViews or UICollectionViews in your project, you can easily add a message like 'No items found' to them. Pay attention that this category adds UILabel directly to the UITableView or UICollectionView, though most of the time this is ok.

How to use
===========
1. Copy `UIScrollView+EmptyViewLabel.h` and `UIScrollView+EmptyViewLabel.m` into your project.
2. Add `[self.tableView addEmptyViewLabelWithText:@"Table view is empty"];` into `- (void)viewDidLoad` method of your UIViewController subclass.
3. Customize label's frame and other properties via `self.tableview.emptyViewLabel`.
4. Whenever the data source is updated, set `self.tableView.showsEmptyViewLabel` to YES or NO.

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView addEmptyViewLabelWithText:@"Table view is empty"];
    self.tableView.emptyViewLabel.textColor = [UIColor darkGrayColor];
}

- (void)dataSourceChanged
{
    self.tableView.showsEmptyViewLabel = !self.dataSource.objects.count;
}
```
