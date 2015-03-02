//
//  TSTRoundProgressLayer2.h
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>


@interface TSTRoundProgressLayer : CALayer

@property (strong, nonatomic) __attribute__((NSObject)) CGColorRef progressColor;
- (void)setProgressColor:(CGColorRef)progressColor animated:(BOOL)animated;

@property (readwrite, nonatomic) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
