//
// Created by cicakmarko on 12/6/13.
//
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import "CDButtonSheet.h"

@interface CDButtonSheet()
@property(nonatomic, strong) NSArray* buttons;
@end


@implementation CDButtonSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSLog(@"%@", NSStringFromCGRect(frame));
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        NSLog(@"Init with Coder. %@", NSStringFromCGRect(self.frame));
    }
    return  self;
}


- (void)setButtonLabels:(NSArray *)buttonLabels
{
    if (buttonLabels.count != 5)
    {
        [NSException raise:@"IllegalArgumentException"
                    format:@"stringLabels array must contain exactly 5 elements, it contained %d", buttonLabels.count];
    }
    NSMutableArray* btns = [NSMutableArray array];
    CGFloat w = self.frame.size.width / buttonLabels.count;
    CGFloat h = self.frame.size.height;
    
    for (NSUInteger i = 0; i < buttonLabels.count; i++)
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(i * w, 0, w, h)];
        [btn setTitle:buttonLabels[i] forState:UIControlStateNormal];
        [btn setTag:i];
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [btns addObject:btn];
        [self addSubview:btn];
    }
}

- (void) buttonPressed:(id)sender
{
    UIButton* btn = sender;
    NSUInteger index = btn.tag;
    [self.delegate buttonSheet:self didSelectButtonAtIndex:index];
}

@end
