//
//  TSTRoundProgressBar2.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import "TSTRoundProgressBar2.h"
#import "TSTRoundProgressLayer2.h"


@implementation TSTRoundProgressBar2


#pragma mark - Layer

+ (Class)layerClass
{
    return [TSTRoundProgressLayer2 class];
}


#pragma mark - Public

- (CGFloat)progressStart
{
    return [(TSTRoundProgressLayer2*)self.layer progressStart];
}

- (void)setProgressStart:(CGFloat)progressStart
{
    [(TSTRoundProgressLayer2*)self.layer setProgressStart:progressStart];
}

- (void)setProgressStart:(CGFloat)progressStart animated:(BOOL)animated
{
    [(TSTRoundProgressLayer2*)self.layer setProgressStart:progressStart animated:animated];
}

- (CGFloat)progressEnd
{
    return [(TSTRoundProgressLayer2*)self.layer progressEnd];
}

- (void)setProgressEnd:(CGFloat)progress
{
    [(TSTRoundProgressLayer2*)self.layer setProgressEnd:progress];
}

- (void)setProgressEnd:(CGFloat)progress animated:(BOOL)animated
{
    [(TSTRoundProgressLayer2*)self.layer setProgressEnd:progress animated:animated];
}

@end
