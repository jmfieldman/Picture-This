//
//  GameViewController.h
//  Picture This
//
//  Created by Jason Fieldman on 2/24/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GameViewController : UIViewController

@property (nonatomic, strong) PFObject *game;

@end
