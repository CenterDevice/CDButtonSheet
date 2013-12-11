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
    self.buttonSheet.buttonLabels = @[ @"Abbrechen", @"Miteigentümer", @"Bearbeiter", @"Leser", @"Keine Berechtigung" ];
    self.buttonSheet.animationDuration = 0.2;
}
- (IBAction)toggle:(id)sender {
    static BOOL hidden = YES;
    [self.buttonSheet setHidden:hidden animated:YES];
    hidden = !hidden;
    
}

#pragma mark - CDButtonSheetDelegate

- (void) buttonSheet:(CDButtonSheet*)sheet didSelectButtonAtIndex:(NSUInteger)index
{
    NSLog(@"SELECTED: %d", index);
}

@end
