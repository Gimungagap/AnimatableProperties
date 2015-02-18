//
//  TSTRoundProgressBar2.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import "TSTRoundProgressBar.h"
#import "TSTRoundProgressLayer.h"


@implementation TSTRoundProgressBar


#pragma mark - Layer

+ (Class)layerClass
{
    return [TSTRoundProgressLayer class];
}


#pragma mark - Public

- (UIColor *)progressColor
{
    return [UIColor colorWithCGColor:[(TSTRoundProgressLayer*)self.layer progressColor]];
}

- (void)setProgressColor:(UIColor *)progressColor
{
    [(TSTRoundProgressLayer*)self.layer setProgressColor:progressColor.CGColor];
}

- (void)setProgressColor:(UIColor *)progressColor animated:(BOOL)animated
{
    [(TSTRoundProgressLayer*)self.layer setProgressColor:progressColor.CGColor animated:animated];
}

- (CGFloat)progress
{
    return [(TSTRoundProgressLayer*)self.layer progress];
}

- (void)setProgress:(CGFloat)progress
{
    [(TSTRoundProgressLayer*)self.layer setProgress:progress];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [(TSTRoundProgressLayer*)self.layer setProgress:progress animated:animated];
}

@end
