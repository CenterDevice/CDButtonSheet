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
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        NSLog(@"Init with Coder. %@", NSStringFromCGRect(self.frame));
        [self setup];
    }
    return  self;
}

- (void) setup
{
    self.animationDuration = 0.5;
}

- (void)setHidden:(BOOL)hidden
{
    [self setHidden:hidden animated:NO];
}

- (void) setHidden:(BOOL)hidden animated:(BOOL)animated
{
    NSTimeInterval duration = animated ? self.animationDuration : 0.0;
    if (!hidden) {
        [super setHidden:NO]; // make visible before animation
    }
    [UIView animateWithDuration:duration animations:^{
        if (hidden)
        {
            self.frame = CGRectOffset(self.frame, 0, self.frame.size.height);
        } else {
            self.frame = CGRectOffset(self.frame, 0, -self.frame.size.height);
        }
    } completion:^(BOOL finished) {
        if (hidden) {
            [super setHidden:YES]; // make hidden after animation
        }
        NSLog(@"Animation finished.");
    }];

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
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
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
