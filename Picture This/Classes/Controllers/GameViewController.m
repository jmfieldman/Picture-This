//
//  GameViewController.m
//  Picture This
//
//  Created by Jason Fieldman on 2/24/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id) init {
    if ((self = [super init])) {
        self.view.backgroundColor = [UIColor magentaColor];
    }
    return self;
}

- (void) setGame:(PFObject *)game {
    _game = game;
    self.title = game[@"caption"];
}

@end
