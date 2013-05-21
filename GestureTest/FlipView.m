//
//  FlipView.m
//  GestureTest
//
//  Created by Vahur Roosimaa on 5/21/13.
//  Copyright (c) 2013 Vahur Roosimaa. All rights reserved.
//

#import "FlipView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlipView
@synthesize frontView = _frontView;
@synthesize backView = _flippedView;

static NSInteger counter;

- (FlipView *)init
{
    if ([self hasFourInchDisplay])
        return [self initWithFrame:CGRectMake(0, 0, 280, 508)];
    else
        return [self initWithFrame:CGRectMake(0, 0, 280, 420)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayout];
        [self updateCounter];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initLayout];
        [self updateCounter];
    }
    return self;
}

- (BOOL)hasFourInchDisplay
{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}

- (void)initLayout
{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:[self hasFourInchDisplay] ? @"FlipView_4" : @"FlipView" owner:self options:nil] lastObject];
    [self addSubview:view];
    
    UITapGestureRecognizer *tapRecongizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
    UIView *flipViewContainer = [[self subviews] lastObject];
    [flipViewContainer addGestureRecognizer:tapRecongizer];
 
}

- (void)updateCounter
{
//    counter++;
//    self.frontLabel.text = [NSString stringWithFormat:@"%d", counter];
}


- (void)flip:(id)sender {
    UIViewAnimationOptions flip = self.flipped ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:self duration:0.75
                       options:flip animations:^{
                           if (!self.flipped) {
                               [self.frontView setHidden:YES];
                               [self.backView setHidden:NO];
                               self.flipped = YES;
                           }
                           else
                           {
                               [self.frontView setHidden:NO];
                               [self.backView setHidden:YES];
                               self.flipped = NO;
                           }
                       } completion:nil];
}
@end
