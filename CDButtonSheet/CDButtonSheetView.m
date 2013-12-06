//
// Created by cicakmarko on 12/6/13.
//
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import "CDButtonSheetView.h"


@interface CDButtonSheetLabel : UILabel
//- (void) setDelegate:(id)delegate;
@end


@protocol CDButtonSheetLabelDelegate
- (void) didSelectLabel:(CDButtonSheetLabel*)label;
@end

@interface CDButtonSheetLabel ()
@property(nonatomic, weak) id <CDButtonSheetLabelDelegate> delegate;
@end

@implementation CDButtonSheetLabel

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self.delegate didSelectLabel:self];
}

- (void) setDelegate:(id<CDButtonSheetLabelDelegate>)delegate
{
    _delegate = delegate;
}

@end


@interface CDButtonSheetView () <CDButtonSheetLabelDelegate>
@property(weak, nonatomic) IBOutlet CDButtonSheetLabel* label1;
@property(weak, nonatomic) IBOutlet CDButtonSheetLabel* label2;
@property(weak, nonatomic) IBOutlet CDButtonSheetLabel* label3;
@property(weak, nonatomic) IBOutlet CDButtonSheetLabel* label4;
@property(weak, nonatomic) IBOutlet CDButtonSheetLabel* label5;
@property(nonatomic, strong) NSArray* labels;
@end


@implementation CDButtonSheetView

- (void) prepareForUse
{
    _labels = @[ self.label1, self.label2, self.label3, self.label4, self.label5 ];

    for (CDButtonSheetLabel* label in self.labels)
    {
        [label setDelegate:self];
    }
}

- (void) setLabels:(NSArray*)stringLabels
{
    if (stringLabels.count != 5)
    {
        [NSException raise:@"IllegalArgumentException"
                    format:@"stringLabels array must contain exactly 5 elements, it contained %d", stringLabels.count];
    }

    for (NSUInteger i = 0; i < stringLabels.count; i++)
    {
        ((CDButtonSheetLabel*) self.labels[i]).text = stringLabels[i];
    }
}

- (void) didSelectLabel:(CDButtonSheetLabel*)selected
{
    for (CDButtonSheetLabel* label in self.labels)
    {
        if (selected == label)
        {
            label.backgroundColor = self.buttonSheetSelectedColor;
        }
        else
        {
            label.backgroundColor = [UIColor clearColor];
        }
    }

    NSUInteger index = [self.labels indexOfObject:selected];
    [self.delegate didSelectButtonAtIndex:index];
}

@end
