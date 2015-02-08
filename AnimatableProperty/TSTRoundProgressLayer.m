//
//  TSTRoundProgressLayer.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 08.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TSTRoundProgressLayer.h"


@interface TSTRoundProgressLayer ()

@property (assign, nonatomic) CGFloat animatableProgress;

@end


@implementation TSTRoundProgressLayer

//otherwise changing animatableProgress won't let view redraw
@dynamic animatableProgress;


#pragma mark - Public

- (CGFloat)progress
{
    return self.animatableProgress;
}

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:MAX(0.0f, MIN(progress, 1.0f)) animated:YES];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    if (animated) {
        [self animateCustomPropertyForKey:NSStringFromSelector(@selector(animatableProgress))];
    } else {
        [self removeAnimationForKey:NSStringFromSelector(@selector(animatableProgress))];
    }
    self.animatableProgress = progress;
}


#pragma mark - Animations

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(animatableProgress))]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)animateCustomPropertyForKey:(NSString *)key {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = [self.presentationLayer valueForKey:key];
    [self addAnimation:animation forKey:key];
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
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextBeginPath(context);
    CGContextAddArc(context,
                    CGRectGetMidX(rect),
                    CGRectGetMidY(rect),
                    radius,
                    -M_PI_2,
                    -M_PI_2 + M_PI*2*self.animatableProgress,
                    NO);
    CGContextStrokePath(context);
}

@end
