//
//  TSTRoundProgressBar.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 08.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "TSTRoundProgressBar.h"
#import "TSTRoundProgressLayer.h"


@interface TSTRoundProgressBar ()


@end


@implementation TSTRoundProgressBar


#pragma mark - Layer

+ (Class)layerClass
{
    return [TSTRoundProgressLayer class];
}


#pragma mark - Public

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
