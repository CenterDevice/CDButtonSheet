//
//  CDViewController.m
//  Demo
//
//  Created by Marko Cicak on 12/6/13.
//  Copyright (c) 2013 CenterDevice GmbH. All rights reserved.
//

#import "CDViewController.h"
#import "CDButtonSheetView.h"

@interface CDViewController () <CDButtonSheetDelegate>
@property(weak, nonatomic) IBOutlet CDButtonSheetView* buttonSheet;
@end

@implementation CDViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.buttonSheet prepareForUse];
    
    self.buttonSheet.delegate = self;
//    self.buttonSheet.buttonSheetSelectedColor = [UIColor yellowColor];
    [self.buttonSheet setLabels:@[ @"Abbrechen", @"Miteigentümer", @"Bearbeiter", @"Leser", @"Keine Berechtigung" ]];
}

#pragma mark - CDButtonSheetDelegate

- (void) didSelectButtonAtIndex:(NSUInteger)index
{
    NSLog(@"SELECTED: %d", index);
}

@end
