//
//  FlipView.h
//  GestureTest
//
//  Created by Vahur Roosimaa on 5/21/13.
//  Copyright (c) 2013 Vahur Roosimaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipView : UIView
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (strong, nonatomic) IBOutlet UIView *frontView;

@property (nonatomic) BOOL flipped;

- (FlipView *)init;

@end
