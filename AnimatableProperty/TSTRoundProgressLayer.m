//
//  TSTRoundProgressLayer2.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TSTRoundProgressLayer.h"


@interface TSTRoundProgressLayer ()


@end


@implementation TSTRoundProgressLayer

//otherwise changing property values won't let view redraw
@dynamic progressColor, progressStart, progressEnd;


#pragma mark - Public

- (void)setProgressColor:(CGColorRef)progressColor animated:(BOOL)animated
{
    self.progressColor = progressColor;
    if (!animated) {
        [self removeAnimationForKey:NSStringFromSelector(@selector(progressColor))];
    }
}

- (void)setProgressStart:(CGFloat)progressStart animated:(BOOL)animated
{
    self.progressStart = progressStart;
    if (!animated) {
        [self removeAnimationForKey:NSStringFromSelector(@selector(progressStart))];
    }
}

- (void)setProgressEnd:(CGFloat)progressEnd animated:(BOOL)animated
{
    self.progressEnd = progressEnd;
    if (!animated) {
        [self removeAnimationForKey:NSStringFromSelector(@selector(progressEnd))];
    }
}


#pragma mark - Animations

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(progressColor))] ||
        [key isEqualToString:NSStringFromSelector(@selector(progressStart))] ||
        [key isEqualToString:NSStringFromSelector(@selector(progressEnd))])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(progressColor))] ||
        [key isEqualToString:NSStringFromSelector(@selector(progressStart))] ||
        [key isEqualToString:NSStringFromSelector(@selector(progressEnd))])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.duration = 1;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fromValue = [self.presentationLayer valueForKey:key];
        return animation;
    }
    return [super actionForKey:key];
}

+ (id)defaultValueForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(progressColor))]) {
        return (id)[UIColor blackColor].CGColor;
    }
    return [super defaultValueForKey:key];
}


#pragma mark - Drawing

- (void)drawInContext:(CGContextRef)context
{
    CGFloat lineWidth = [UIScreen mainScreen].scale;
    
    CGRect rect = self.bounds;
    if (rect.size.height <= lineWidth || rect.size.width <= lineWidth) return;
    rect = CGRectInset(rect, lineWidth, lineWidth);
    
    CGFloat radius = MIN(rect.size.height, rect.size.width)/2;
    
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, self.progressColor);
    
    CGContextBeginPath(context);
    CGContextAddArc(context,
                    CGRectGetMidX(rect),
                    CGRectGetMidY(rect),
                    radius,
                    -M_PI_2 + M_PI*2*self.progressStart,
                    -M_PI_2 + M_PI*2*self.progressEnd,
                    NO);
    CGContextStrokePath(context);
}

@end
