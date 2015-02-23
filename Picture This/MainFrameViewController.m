//
//  MainFrameViewController.m
//  Picture This
//
//  Created by Jason Fieldman on 2/23/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "MainFrameViewController.h"

@interface MainFrameViewController ()

@end

@implementation MainFrameViewController

+ (MainFrameViewController*) sharedInstance {
    static MainFrameViewController *singleton = nil;
    if (singleton == nil) singleton = [[MainFrameViewController alloc] init];
    return singleton;
}

- (id) init {
    if ((self = [super init])) {
        self.title = @"Picture This!";
        self.view.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

@end
