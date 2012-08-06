//
//  ViewController.m
//  ArcPullToRefresh
//
//  Created by hisamatsu on 08/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray *_list;
    PullToRefreshView *_pull;
}

@property(weak, nonatomic) IBOutlet UITableView *sampleTableView;
@end

@implementation ViewController
@synthesize sampleTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _list = [[NSMutableArray alloc] init];
    [_list addObject:@"hoge"];
    [_list addObject:@"foo"];
    [_list addObject:@"bar"];

    _pull = [[PullToRefreshView alloc] initWithScrollView:self.sampleTableView];
    [_pull setDelegate:self];
    [self.sampleTableView addSubview:_pull];

    self.sampleTableView.delegate = self;
    self.sampleTableView.dataSource = self;
}

- (void)viewDidUnload {
    [self setSampleTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark PullToRefreshView -----------------------------------

- (void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view {
    NSLog(@"pullToRefreshViewShouldRefresh");
    [self reloadTableData];
}

- (NSDate *)pullToRefreshViewLastUpdated:(PullToRefreshView *)view {
    NSLog(@"pullToRefreshViewLastUpdated");
    return [NSDate date];
}

- (void)reloadTableData {
    [self.sampleTableView reloadData];
    [_pull finishedLoading];
}

#pragma mark UITableView -----------------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    UILabel *label = (UILabel *) [cell viewWithTag:1];
    label.text = [_list objectAtIndex:(NSUInteger) indexPath.section];
    NSLog(@"[_list objectAtIndex:(NSUInteger) indexPath.section] - %@", [_list objectAtIndex:(NSUInteger) indexPath.section]);

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end