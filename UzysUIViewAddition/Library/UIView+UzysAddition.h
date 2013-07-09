//
//  UIView+UzysAddition.h
//  UzysUIViewAddition
//
//  Created by Uzys on 12. 6. 21..
//  Copyright (c) 2012년 Uzys. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UZYS_ALIGN_ANCHORPOINT) {
    UZYS_ALIGN_ANCHORPOINT_CENTER,
    UZYS_ALIGN_ANCHORPOINT_LEFT,
    UZYS_ALIGN_ANCHORPOINT_RIGHT,
    UZYS_ALIGN_ANCHORPOINT_NONE
};

typedef NS_ENUM(NSInteger, UZYS_VALIGN_ANCHORPOINT) {
    UZYS_VALIGN_ANCHORPOINT_MIDDLE,
    UZYS_VALIGN_ANCHORPOINT_TOP,
    UZYS_VALIGN_ANCHORPOINT_BOTTOM,
    UZYS_VALIGN_ANCHORPOINT_NONE
};
@interface UIView (UzysAddition)

//Frame Access Property
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;


//Offset Method
- (void) moveWithOffsetX:(CGFloat)offsetX;
- (void) moveWithOffsetY:(CGFloat)offsetY;
- (void) moveWithOffsetPoint:(CGPoint)offsetPoint;


// Align Method
- (void) centerInSuperview;
- (void) centerHorizontallyInSuperview;
- (void) centerVerticallyInSuperview;

- (void) alignToTopInSuperviewWithInset:(CGFloat)inset;
- (void) alignToBottomInSuperviewWithInset:(CGFloat)intset;
- (void) alignToLeftInSuperviewWithInset:(CGFloat)intset;
- (void) alignToRightInSuperviewWithInset:(CGFloat)intset;


- (void) alignToLeftOfView:(UIView *)view offset:(CGFloat) offset valign:(UZYS_VALIGN_ANCHORPOINT)valign;
- (void) alignToRightOfView:(UIView *)view offset:(CGFloat) offset valign:(UZYS_VALIGN_ANCHORPOINT)valign;
- (void) alignToTopOfView:(UIView *)view offset:(CGFloat) offset align:(UZYS_ALIGN_ANCHORPOINT)align;
- (void) alignToBottomOfView:(UIView *)view offset:(CGFloat) offset align:(UZYS_ALIGN_ANCHORPOINT)align;


//Helper Method
- (UIImageView *)createSnapshot;
- (void)showDebugFrame:(BOOL)debug;
- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
                 bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;
- (BOOL)isViewVisible;
@end
