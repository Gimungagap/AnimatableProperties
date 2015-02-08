//
//  TSTRoundProgressBar.h
//  AnimatableProperty
//
//  Created by Sergey Rakov on 08.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface TSTRoundProgressBar : UIView

@property (readwrite, nonatomic) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
