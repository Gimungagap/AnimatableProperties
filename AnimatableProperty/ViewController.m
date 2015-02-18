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

@property (weak, nonatomic) IBOutlet TSTRoundProgressBar *progressBar2;

@end


@implementation ViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.progressBar2.progressStart = 0.2;
        self.progressBar2.progressEnd = 0.8;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.progressBar2.progressColor = [UIColor magentaColor];
            self.progressBar2.progressStart = 0.1;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.progressBar2.progressColor = [UIColor yellowColor];
                self.progressBar2.progressEnd = 0.2;
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self.progressBar2 setProgressColor:[UIColor redColor] animated:NO];
                    [self.progressBar2 setProgressStart:0.2 animated:NO];
                    [self.progressBar2 setProgressEnd:0.8 animated:YES];
                });
            });
        });
    });
    
}

@end
