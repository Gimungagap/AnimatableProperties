//
//  ViewController.m
//  AnimatableProperty
//
//  Created by Sergey Rakov on 08.02.15.
//  Copyright (c) 2015 Gimungagap. All rights reserved.
//


#import "ViewController.h"
#import "TSTRoundProgressBar.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet TSTRoundProgressBar *progressBar;

@end


@implementation ViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.progressBar setProgress:0.2 animated:NO];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.progressBar.progressColor = [UIColor magentaColor];
        self.progressBar.progress = 0.9;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.progressBar.progressColor = [UIColor greenColor];
            self.progressBar.progress = 0.4;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.progressBar setProgressColor:[UIColor redColor] animated:NO];
                [self.progressBar setProgress:0.9 animated:NO];
            });
        });
    });
    
}

@end
