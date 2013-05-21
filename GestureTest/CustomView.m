//
//  CustomView.m
//  GestureTest
//
//  Created by Vahur Roosimaa on 5/21/13.
//  Copyright (c) 2013 Vahur Roosimaa. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil] lastObject];
        [self addSubview:view];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil] lastObject];
        [self addSubview:view];
    }
    
    return self;
}


@end
