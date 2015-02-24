//
//  MainFrameViewController.h
//  Picture This
//
//  Created by Jason Fieldman on 2/23/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainFrameViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int whichGamelist;

+ (MainFrameViewController*) sharedInstance;

@end
