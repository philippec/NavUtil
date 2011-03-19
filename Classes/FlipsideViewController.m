//
//  FlipsideViewController.m
//  NavUtil
//
//  Created by Philippe on 11-03-19.
//  Copyright 2011 Philippe Casgrain. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate, tableView = _tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	self.tableView = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0: 
            return 3;
        default:
            return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Row One";
            break;
        case 1:
            cell.textLabel.text = @"Row Two";
            break;
        case 2:
            cell.textLabel.text = @"Row Three";
            break;
        default:
            cell.textLabel.text = @"Row Four";
            break;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0: 
            return @"First section";
        default:
            return @"Second section";
    }
}


@end