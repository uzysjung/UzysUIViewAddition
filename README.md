UzysUIViewAddition
==================

Easy way to access view's frame, And provide easy way to layout UIViews programatically to maintain readability of code. 

## Installation
Copy over the files libary folder to your project folder

Add QuartzCore.Framework

## Usage

Import header.

``` objective-c
#import "UIView+UzysAddition.h"
```

####1. frame access
``` objective-c
    self.view.x = 5;
    self.view.y = 10;
    self.view.width = 100;
    self.view.height = 200;
    self.view.origin = CGPointMake(10, 10);
    self.view.size = CGSizeMake(100, 100);
```

####2. View Layout in superView
``` objective-c
    [self.viewMoving centerHorizontallyInSuperview];
    [self.viewMoving centerVerticallyInSuperview];
    [self.viewMoving centerInSuperview];
```

####2. View Layout in superView with Inset
``` objective-c
    [self.viewMoving alignToTopInSuperviewWithInset:220];
    [self.viewMoving alignToBottomInSuperviewWithInset:220];
    [self.viewMoving alignToLeftInSuperviewWithInset:220];
    [self.viewMoving alignToRightInSuperviewWithInset:220];
```

####3. View Layout with otherView with Inset
``` objective-c
    [self.viewMoving alignToBottomOfView:self.viewBase offset:5 align:UZYS_ALIGN_ANCHORPOINT_CENTER];
    [self.viewMoving alignToTopOfView:self.viewBase offset:5 align:UZYS_ALIGN_ANCHORPOINT_CENTER];
    [self.viewMoving alignToLeftOfView:self.viewBase offset:5 valign:UZYS_VALIGN_ANCHORPOINT_MIDDLE];
    [self.viewMoving alignToRightOfView:self.viewBase offset:5 valign:UZYS_VALIGN_ANCHORPOINT_MIDDLE];
```
