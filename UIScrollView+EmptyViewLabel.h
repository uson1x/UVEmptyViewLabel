//
//  UITableView+EmptyTableViewLabel.h
//
//
//  Created by Ivan Parfenchuk on 21.11.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (EmptyViewLabel)

- (void)addEmptyViewLabelWithText:(NSString*)text;

@property (nonatomic, strong, readonly) UILabel *emptyViewLabel;
@property (nonatomic, assign) BOOL showsEmptyViewLabel;

@end
