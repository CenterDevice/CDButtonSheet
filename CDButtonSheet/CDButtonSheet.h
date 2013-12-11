//
// Created by cicakmarko on 12/6/13.
//
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDButtonSheet;

@protocol CDButtonSheetDelegate
- (void) buttonSheet:(CDButtonSheet*)sheet didSelectButtonAtIndex:(NSUInteger)index;
@end


@interface CDButtonSheet : UIView

@property(nonatomic, weak) id <CDButtonSheetDelegate> delegate;
@property(nonatomic, strong) NSArray* buttonLabels;
@property(nonatomic, strong) UIColor* buttonSheetSelectedColor;
@property(nonatomic, assign) NSTimeInterval animationDuration;
@property(nonatomic, assign, getter = shouldHideOnSelect) BOOL hideOnSelect;

- (void) setHidden:(BOOL)hidden animated:(BOOL)animated;

@end
