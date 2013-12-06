//
// Created by cicakmarko on 12/6/13.
//
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDButtonSheetDelegate
- (void) didSelectButtonAtIndex:(NSUInteger)index;
@end


@interface CDButtonSheetView : UIView

@property(nonatomic, weak) id <CDButtonSheetDelegate> delegate;
@property(nonatomic, strong) UIColor* buttonSheetSelectedColor;

- (void) prepareForUse;

- (void) setLabels:(NSArray*)stringLabels;

@end
