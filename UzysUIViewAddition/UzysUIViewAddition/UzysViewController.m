//
//  UzysViewController.m
//  UzysUIViewAddition
//
//  Created by JAE HOON JUNG on 13. 6. 21..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import "UzysViewController.h"
#import "UIView+UzysAddition.h"
@interface UzysViewController ()

@end

@implementation UzysViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_viewBase release];
    [_viewMoving release];
    [super dealloc];
}
- (IBAction)actionOffset:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.viewMoving moveWithOffsetX:20];       
    }];
}

- (IBAction)actionCenter:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [self.viewMoving centerHorizontallyInSuperview];
    }];
}

- (IBAction)actionBottom:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [self.viewMoving alignToBottomInSuperviewWithInset:220];
    }];
}

- (IBAction)actionBottomOfView:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [self.viewMoving alignToBottomOfView:self.viewBase offset:5 align:UZYS_ALIGN_ANCHORPOINT_CENTER];
    }];
}
@end
