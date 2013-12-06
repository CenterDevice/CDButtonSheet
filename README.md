CDButtonSheet
=============

CDButtonSheet is a simple UIView component which enables user to select one of five possible options. Each option is defined with it's label. When option is selected, it's background is colored in user-defined way.

Installation
------------
* Drag the `CDButtonSheet/CDButtonSheet` folder into your project

Usage
-----
(see sample Xcode project in `/Demo`)

Copy `CDButtonSheet` view from `Main.storyboard` in `Demo` project.
In viewDidLoad call `prepareForUse` method and set viewController as a delegate:

```
[self.buttonSheet prepareForUse];
self.buttonSheet.delegate = self;
self.buttonSheet.buttonSheetSelectedColor = [UIColor yellowColor];
```
Instead of writing last line through code, you can set `buttonSheetSelectedColor` property in Xcode in User Defined Runtime Attributes for CDButtonSheetView.

Optionally set new text for labels:

```
[self.buttonSheet setLabels:@[ @"Label 1", @"Label 2", @"Label 3", @"Label 4", @"Label 5" ]];
```
Implement `CDButtonSheetDelegate` protocol and it's `- (void) didSelectButtonAtIndex:(NSUInteger)index` method.
