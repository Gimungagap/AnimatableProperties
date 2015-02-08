//
//  TSTRoundProgressLayer.h
//  AnimatableProperty
//
//  Created by Sergey Rakov on 08.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>


@interface TSTRoundProgressLayer : CALayer

@property (readwrite, nonatomic) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
