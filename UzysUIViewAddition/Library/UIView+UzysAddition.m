//
//  UIView+UzysAddition.m
//  UzysUIViewAddition
//
//  Created by Uzys on 12. 6. 21..
//  Copyright (c) 2012년 Uzys. All rights reserved.
//

#import "UIView+UzysAddition.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (UzysAddition)

#pragma mark - frame Property Direct Access
- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frameNew = self.frame;
    frameNew.size = size;
    self.frame = frameNew;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frameNew = self.frame;
    frameNew.origin = origin;
    self.frame = frameNew;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect frameNew = self.frame;
    frameNew.origin.x = x;
    self.frame = frameNew;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frameNew = self.frame;
    frameNew.origin.y =y;
    self.frame = frameNew;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frameNew = self.frame;
    frameNew.size.height = height;
    self.frame = frameNew;
}

- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frameNew = self.frame;
    frameNew.size.width = width;
    self.frame = frameNew;
}

#pragma mark - Offset
- (void) moveWithOffsetX:(CGFloat)offsetX
{
    CGRect rect = self.frame;
    rect.origin.x = rect.origin.x + offsetX;
    self.frame = rect;
}
- (void) moveWithOffsetY:(CGFloat)offsetY
{
    CGRect rect = self.frame;
    rect.origin.y = rect.origin.y + offsetY;
    self.frame = rect;
    
}
- (void) moveWithOffsetPoint:(CGPoint)offsetPoint
{
    CGRect rect = self.frame;
    rect.origin.x = rect.origin.x + offsetPoint.x;
    rect.origin.y = rect.origin.y + offsetPoint.y;
    self.frame = rect;
}


#pragma mark - frame Align
- (void)centerInSuperview
{
    if([self superview])
    {
        CGPoint point;
        point.x = roundf((self.superview.bounds.size.width - self.bounds.size.width)/2);
        point.y = roundf((self.superview.bounds.size.height - self.bounds.size.height)/2);
        self.origin = point;
    }
}
- (void)centerHorizontallyInSuperview
{
    if([self superview])
    {
        self.x = roundf((self.superview.bounds.size.width - self.bounds.size.width)/2);
    }
}
- (void)centerVerticallyInSuperview
{
    if([self superview])
    {
        self.y = roundf((self.superview.bounds.size.height - self.bounds.size.height)/2);
    }
}

- (void)alignToTopInSuperviewWithInset:(CGFloat)inset
{
    if([self superview])
        self.y = inset;
}
- (void)alignToBottomInSuperviewWithInset:(CGFloat)intset
{
    if([self superview])
    {
        self.y = self.superview.size.height - self.height - intset  ;
    }
}
- (void)alignToLeftInSuperviewWithInset:(CGFloat)intset
{
    if([self superview])
        self.x = intset;
    
}
- (void)alignToRightInSuperviewWithInset:(CGFloat)intset
{
    if([self superview])
    {
        self.x = self.superview.size.width - self.width - intset;
    }
}

- (void) alignToLeftOfView:(UIView *)view offset:(CGFloat) offset valign:(UZYS_VALIGN_ANCHORPOINT)valign
{
    if(!view)
        return;
    CGPoint point;
    point.x = view.frame.origin.x - offset - self.bounds.size.width;
    
    if(valign == UZYS_VALIGN_ANCHORPOINT_BOTTOM)
    {
        point.y = view.y - (self.height - view.height);
    }
    else if(valign == UZYS_VALIGN_ANCHORPOINT_MIDDLE)
    {
        point.y = view.y - (self.height - view.height)/2;
    }
    else if(valign == UZYS_VALIGN_ANCHORPOINT_TOP)
    {
        point.y = view.y;
    }
    
    self.origin = point;
}
- (void) alignToRightOfView:(UIView *)view offset:(CGFloat) offset valign:(UZYS_VALIGN_ANCHORPOINT)valign
{
    if(!view)
        return;
    CGPoint point;

    point.x =  view.frame.origin.x + view.frame.size.width + offset;
    
    if(valign == UZYS_VALIGN_ANCHORPOINT_BOTTOM)
    {
        point.y = view.y - (self.height - view.height);
    }
    else if(valign == UZYS_VALIGN_ANCHORPOINT_MIDDLE)
    {
        point.y = view.y - (self.height - view.height)/2;
    }
    else if(valign == UZYS_VALIGN_ANCHORPOINT_TOP)
    {
        point.y = view.y;
    }
    
    self.origin = point;
}
- (void) alignToTopOfView:(UIView *)view offset:(CGFloat) offset align:(UZYS_ALIGN_ANCHORPOINT)align
{
    if(!view)
        return;
    CGPoint point;

    point.y = view.origin.y - offset - self.height;
    
    if(align == UZYS_ALIGN_ANCHORPOINT_LEFT)
    {
        point.x = view.x;
    }
    else if(align == UZYS_ALIGN_ANCHORPOINT_CENTER)
    {
        point.x = view.x - (self.width - view.width)/2;
    }
    else if(align == UZYS_ALIGN_ANCHORPOINT_RIGHT)
    {
        point.x = view.x - (self.width - view.width);
    }
    
    self.origin = point;
}
- (void) alignToBottomOfView:(UIView *)view offset:(CGFloat) offset align:(UZYS_ALIGN_ANCHORPOINT)align
{
    if(!view)
        return;
    CGPoint point;

    point.y = view.origin.y + view.height + offset;
    
    if(align == UZYS_ALIGN_ANCHORPOINT_LEFT)
    {
        point.x = view.x;
    }
    else if(align == UZYS_ALIGN_ANCHORPOINT_CENTER)
    {
        point.x = view.x - (self.width - view.width)/2;
    }
    else if(align == UZYS_ALIGN_ANCHORPOINT_RIGHT)
    {
        point.x = view.x - (self.width - view.width);
    }
    
    self.origin = point;
    
}


#pragma mark - HELPER

- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight
{
    UIImage *mask = createRoundedCornerMask([self bounds], topLeft, topRight, bottomLeft, bottomRight);
    CALayer *layerMask = [CALayer layer];
    [layerMask setFrame:[self bounds]];
    [layerMask setContents:(id)[mask CGImage]];
    [[self layer] setMask:layerMask];
}


- (UIImageView *)createSnapshot
{
    UIGraphicsBeginImageContextWithOptions([self bounds].size, YES, 0);
    
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), -[self bounds].origin.x, -[self bounds].origin.y);
    
    [[self layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
#if __has_feature(objc_arc)
    UIImageView *snapshot = [[UIImageView alloc] initWithImage:image];
#else
    UIImageView *snapshot = [[[UIImageView alloc] initWithImage:image] autorelease];
#endif
    [snapshot setFrame:[self frame]];
    
    return snapshot;
}

- (void)showDebugFrame:(BOOL)debug
{
    if(debug)
    {
        [[self layer] setBorderColor:[[UIColor redColor] CGColor]];
        [[self layer] setBorderWidth:1.0f];
    }
    else
    {
        [[self layer] setBorderColor:nil];
        [[self layer] setBorderWidth:0.0f];
    }
}

- (BOOL)isViewVisible
{
    BOOL hidden = self.isHidden || self.alpha == 0 || CGRectIsEmpty(self.frame);
    return !hidden;
}

static inline UIImage* createRoundedCornerMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br)
{
    CGContextRef context;
    CGColorSpaceRef colorSpace;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    context = CGBitmapContextCreate( NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast );
    
    CGColorSpaceRelease(colorSpace);
    
    if ( context == NULL )
    {
        return NULL;
    }
    
    CGFloat minx = CGRectGetMinX( rect ), midx = CGRectGetMidX( rect ), maxx = CGRectGetMaxX( rect );
    CGFloat miny = CGRectGetMinY( rect ), midy = CGRectGetMidY( rect ), maxy = CGRectGetMaxY( rect );
    
    CGContextBeginPath( context );
    CGContextSetGrayFillColor( context, 1.0, 0.0 );
    CGContextAddRect( context, rect );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    CGContextSetGrayFillColor( context, 1.0, 1.0 );
    CGContextBeginPath( context );
    CGContextMoveToPoint( context, minx, midy );
    CGContextAddArcToPoint( context, minx, miny, midx, miny, radius_bl );
    CGContextAddArcToPoint( context, maxx, miny, maxx, midy, radius_br );
    CGContextAddArcToPoint( context, maxx, maxy, midx, maxy, radius_tr );
    CGContextAddArcToPoint( context, minx, maxy, minx, midy, radius_tl );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    CGImageRef bitmapContext = CGBitmapContextCreateImage( context );
    CGContextRelease( context );
    
    UIImage *mask = [UIImage imageWithCGImage:bitmapContext];
    
    CGImageRelease(bitmapContext);
    
    return mask;
}

@end
