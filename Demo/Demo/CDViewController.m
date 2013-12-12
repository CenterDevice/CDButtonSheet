//
//  CDViewController.m
//  Demo
//
//  Created by Marko Cicak on 12/6/13.
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import "CDViewController.h"
#import "CDButtonSheet.h"

@interface CDViewController () <CDButtonSheetDelegate>
@property(weak, nonatomic) IBOutlet CDButtonSheet* buttonSheet;
@end

@implementation CDViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.buttonSheet.delegate = self;
    self.buttonSheet.buttonSheetSelectedColor = [UIColor yellowColor];
    self.buttonSheet.buttonLabels = @[ @"Abbrechen", @"Miteigentümer", @"Bearbeiter", @"Leser" ];
    self.buttonSheet.animationDuration = 0.2;
    self.buttonSheet.hideOnSelect = YES;
}

- (IBAction)toggle:(id)sender {
    [self.buttonSheet setHidden:!self.buttonSheet.hidden animated:YES];
}

#pragma mark - CDButtonSheetDelegate

- (void) buttonSheet:(CDButtonSheet*)sheet didSelectButtonAtIndex:(NSUInteger)index
{
    CGRect buttonFrame = [sheet frameForButtonAtIndex:index];
    NSLog(@"SELECTED: %d :: %@", index, NSStringFromCGRect(buttonFrame));

    UILabel* snapshot = [[UILabel alloc] initWithFrame:buttonFrame];
    snapshot.text = self.buttonSheet.buttonLabels[index];
    snapshot.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:snapshot];
    snapshot.center = [self.view convertPoint:CGPointMake(CGRectGetMidX(buttonFrame), CGRectGetMidY(buttonFrame)) fromView:sheet];
    [UIView animateWithDuration:0.5 animations:^{
        snapshot.alpha = 0.0;
        snapshot.transform = CGAffineTransformMakeScale(0.1, 0.1);
        snapshot.center = self.view.center;
    } completion:^(BOOL finished) {
        [snapshot removeFromSuperview];
    }];
    
    
}

@end
