//
//  ViewController.h
//  ArcPullToRefresh
//
//  Created by hisamatsu on 08/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefreshView.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, PullToRefreshViewDelegate>

@end