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
    return [(TSTRoundProgressLayer*)self.layer progressColor];
}

- (void)setProgressColor:(UIColor *)progressColor
{
    [(TSTRoundProgressLayer*)self.layer setProgressColor:progressColor];
}

- (void)setProgressColor:(UIColor *)progressColor animated:(BOOL)animated
{
    [(TSTRoundProgressLayer*)self.layer setProgressColor:progressColor animated:animated];
}

- (CGFloat)progressStart
{
    return [(TSTRoundProgressLayer*)self.layer progressStart];
}

- (void)setProgressStart:(CGFloat)progressStart
{
    [(TSTRoundProgressLayer*)self.layer setProgressStart:progressStart];
}

- (void)setProgressStart:(CGFloat)progressStart animated:(BOOL)animated
{
    [(TSTRoundProgressLayer*)self.layer setProgressStart:progressStart animated:animated];
}

- (CGFloat)progressEnd
{
    return [(TSTRoundProgressLayer*)self.layer progressEnd];
}

- (void)setProgressEnd:(CGFloat)progress
{
    [(TSTRoundProgressLayer*)self.layer setProgressEnd:progress];
}

- (void)setProgressEnd:(CGFloat)progress animated:(BOOL)animated
{
    [(TSTRoundProgressLayer*)self.layer setProgressEnd:progress animated:animated];
}

@end
