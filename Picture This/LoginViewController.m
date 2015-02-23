//
//  LoginViewController.m
//  Picture This
//
//  Created by Jason Fieldman on 2/20/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "LoginViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id) init {
    if ((self = [super init])) {
        
        self.view.backgroundColor = [UIColor cyanColor];
        
        UILabel *hello = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
        hello.text = @"Picture This!";
        hello.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:hello];
        
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        loginButton.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60);
        [loginButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
        loginButton.titleLabel.font = [UIFont fontWithName:@"Courier" size:24];
        [loginButton addTarget:self action:@selector(pressedLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    return self;
}


- (void) pressedLoginButton:(id)sender {
    
    [PFFacebookUtils logInWithPermissions:@[@"public_profile", @"user_friends"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
        }
    }];
    
}

@end
