//
//  UIScrollView+EmptyViewLabel.m
//
//
//  Created by Ivan Parfenchuk on 21.11.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "UIScrollView+EmptyViewLabel.h"
#import <objc/runtime.h>

static CGFloat const defaultYOffset = 20.0f;
static CGFloat const defaultHeight = 100.0f;

static char UIScrollViewViewEmptyViewLabel;

@implementation UIScrollView (EmptyViewLabel)
@dynamic emptyViewLabel;

- (void)addEmptyViewLabelWithText:(NSString *)text
{
    if(!self.emptyViewLabel) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentInset.top + defaultYOffset, self.bounds.size.width, defaultHeight)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        label.text = text;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [self addSubview:label];
        self.emptyViewLabel = label;
        self.showsEmptyViewLabel = NO;
    }
}

- (void)setEmptyViewLabel:(UILabel *)emptyViewLabel
{
    [self willChangeValueForKey:@"UIScrollViewViewEmptyViewLabel"];
    objc_setAssociatedObject(self, &UIScrollViewViewEmptyViewLabel,
                             emptyViewLabel,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"UIScrollViewViewEmptyViewLabel"];
}

- (UILabel *)emptyViewLabel
{
    return objc_getAssociatedObject(self, &UIScrollViewViewEmptyViewLabel);
}

- (BOOL)showsEmptyViewLabel
{
    return !self.emptyViewLabel.hidden;
}

- (void)setShowsEmptyViewLabel:(BOOL)showsEmptyViewLabel
{
    self.emptyViewLabel.hidden = !showsEmptyViewLabel;
}

@end
