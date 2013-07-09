//
//  UzysViewController.h
//  UzysUIViewAddition
//
//  Created by JAE HOON JUNG on 13. 6. 21..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UzysViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *viewBase;
@property (retain, nonatomic) IBOutlet UIView *viewMoving;

- (IBAction)actionOffset:(id)sender;
- (IBAction)actionCenter:(id)sender;

- (IBAction)actionBottom:(id)sender;
- (IBAction)actionBottomOfView:(id)sender;

@end
