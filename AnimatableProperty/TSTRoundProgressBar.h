//
//  TSTRoundProgressBar2.h
//  AnimatableProperty
//
//  Created by Sergey Rakov on 12.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface TSTRoundProgressBar : UIView

@property (readwrite, nonatomic) UIColor *progressColor;
- (void)setProgressColor:(UIColor*)progressColor animated:(BOOL)animated;

@property (readwrite, nonatomic) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
