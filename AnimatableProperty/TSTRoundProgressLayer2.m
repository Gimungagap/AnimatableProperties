//
//  TSTRoundProgressLayer2.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TSTRoundProgressLayer2.h"


@interface TSTRoundProgressLayer2 ()

@property (assign, nonatomic) CGFloat animatableProgressStart;
@property (assign, nonatomic) CGFloat animatableProgressEnd;

@end


@implementation TSTRoundProgressLayer2

//otherwise changing animatableProgress won't let view redraw
@dynamic animatableProgressStart, animatableProgressEnd;


#pragma mark - Public

- (CGFloat)progressStart
{
    return self.progressStart;
}

- (void)setProgressStart:(CGFloat)progressStart
{
    [self setProgressStart:progressStart animated:YES];
}

- (void)setProgressStart:(CGFloat)progressStart animated:(BOOL)animated
{
    self.animatableProgressStart = progressStart;
    if (!animated) {
        [self removeAnimationForKey:NSStringFromSelector(@selector(animatableProgressStart))];
    }
}

- (CGFloat)progressEnd
{
    return self.animatableProgressEnd;
}

- (void)setProgressEnd:(CGFloat)progressEnd
{
    [self setProgressEnd:progressEnd animated:YES];
}

- (void)setProgressEnd:(CGFloat)progressEnd animated:(BOOL)animated
{
    self.animatableProgressEnd = progressEnd;
    if (!animated) {
        [self removeAnimationForKey:NSStringFromSelector(@selector(animatableProgressEnd))];
    }
}


#pragma mark - Animations

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(animatableProgressStart))] ||
        [key isEqualToString:NSStringFromSelector(@selector(animatableProgressEnd))])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:NSStringFromSelector(@selector(animatableProgressStart))] ||
        [key isEqualToString:NSStringFromSelector(@selector(animatableProgressEnd))])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.duration = 1;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fromValue = [self.presentationLayer valueForKey:key];
        return animation;
    }
    return [super actionForKey:key];
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
                    -M_PI_2 + M_PI*2*self.animatableProgressStart,
                    -M_PI_2 + M_PI*2*self.animatableProgressEnd,
                    NO);
    CGContextStrokePath(context);
}

@end
