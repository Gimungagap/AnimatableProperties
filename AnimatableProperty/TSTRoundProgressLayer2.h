//
//  TSTRoundProgressLayer2.h
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>


@interface TSTRoundProgressLayer2 : CALayer

@property (readwrite, nonatomic) CGFloat progressStart;
- (void)setProgressStart:(CGFloat)progressStart animated:(BOOL)animated;

@property (readwrite, nonatomic) CGFloat progressEnd;
- (void)setProgressEnd:(CGFloat)progressEnd animated:(BOOL)animated;

@end
