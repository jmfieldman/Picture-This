//
//  MainFrameViewController.m
//  Picture This
//
//  Created by Jason Fieldman on 2/23/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "MainFrameViewController.h"
#import "GameViewController.h"
#import <Parse/Parse.h>

@interface MainFrameViewController ()

@end

@implementation MainFrameViewController

+ (MainFrameViewController*) sharedInstance {
    static MainFrameViewController *singleton = nil;
    @synchronized(self) {
        if (singleton == nil) singleton = [[MainFrameViewController alloc] init];
    }
    return singleton;
}

- (id) init {
    if ((self = [super init])) {
        self.title = @"Picture This!";
        self.view.backgroundColor = [UIColor orangeColor];
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    if (section == 1) return 0;
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Yay"];
        cell.textLabel.text = @"New Game";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 60;
    }
    return 60;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = @"Section Header";
        label.backgroundColor = [UIColor orangeColor];
        return label;
    }
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"Current", @"Past"]];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    return segment;
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView *caption = [[UIAlertView alloc] initWithTitle:@"Caption" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Start", nil];
    caption.alertViewStyle = UIAlertViewStylePlainTextInput;
    [caption show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.cancelButtonIndex) return;
    NSString *caption = [alertView textFieldAtIndex:0].text;
    NSLog(@"Caption: %@", caption);
    
    PFObject *newGame = [PFObject objectWithClassName:@"Game"];
    newGame[@"hostUser"] = [PFUser currentUser];
    newGame[@"caption"]  = caption;
    [newGame saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        GameViewController *controller = [[GameViewController alloc] init];
        controller.game = newGame;
        [self.navigationController pushViewController:controller animated:YES];
    }];
    
}

- (void) segmentChanged:(UISegmentedControl*)sender {
    _whichGamelist = (int)sender.selectedSegmentIndex;
    NSLog(@"selected: %d", _whichGamelist);
}

@end
