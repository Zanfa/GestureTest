//
//  ViewController.m
//  GestureTest
//
//  Created by Vahur Roosimaa on 5/20/13.
//  Copyright (c) 2013 Vahur Roosimaa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize viewStack = _viewStack;
@synthesize currentView = _currentView;
@synthesize nextView = _nextView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currentView = [[FlipView alloc] init];
    [self.viewStack addSubview:self.currentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)recognizer {
    
    UISwipeGestureRecognizerDirection direction = [recognizer direction];
    NSInteger animationEndX = direction == UISwipeGestureRecognizerDirectionRight ? self.view.frame.size.width : -self.view.frame.size.width;
    
    self.nextView = [[FlipView alloc] initWithFrame:CGRectMake(0, 0, 280, 508)];
    [self.viewStack insertSubview:self.nextView atIndex:0];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame = self.currentView.frame;
                         frame.origin.x += animationEndX;
                         self.currentView.frame = frame;
                     }
                     completion:^(BOOL finished){
                         [self.currentView removeFromSuperview];
                         self.currentView = self.nextView;
                     }];
//
}
@end
