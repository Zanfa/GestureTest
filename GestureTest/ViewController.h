//
//  ViewController.h
//  GestureTest
//
//  Created by Vahur Roosimaa on 5/20/13.
//  Copyright (c) 2013 Vahur Roosimaa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FlipView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) FlipView *currentView;
@property (strong, nonatomic) FlipView *nextView;

@property (strong, nonatomic) IBOutlet UIView *viewStack;

- (IBAction)swipe:(id)sender;

@end
