//
//  FlipsideViewController.m
//  NavUtil
//
//  Created by Philippe on 11-03-19.
//  Copyright 2011 Philippe Casgrain. All rights reserved.
//

#import "FirstSectionDetailController.h"
#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate, tableView = _tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];   
	
	// install the done button
	UIBarButtonItem *bbi = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)] autorelease];
	self.navigationItem.leftBarButtonItem = bbi;
    // Initial title string
    self.navigationItem.title = @"Settings";
		
    CGRect frame = self.view.frame;
	
    self.tableView = [[[UITableView alloc] initWithFrame:frame style: UITableViewStyleGrouped] autorelease];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview: self.tableView];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

#pragma mark UITableView delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRow {%d} in section {%d}", indexPath.row, indexPath.section);	
	// Now you can create and push a view controller here as you expect, because self.navigationController will work
    switch (indexPath.section) 
    {
        case 0:
            {
                FirstSectionDetailController *controller = [[FirstSectionDetailController alloc] initWithNibName: @"FirstSectionDetail" bundle: nil];
                switch (indexPath.row) 
                {
                    case 0:
                        controller.rowLabelText = @"Row One";
                        break;
                    case 1:
                        controller.rowLabelText = @"Row Two";
                        break;
                    case 2:
                        controller.rowLabelText = @"Row Three";
                        break;
                    default:
                        controller.rowLabelText = @"Row Four";
                        break;
                }
                controller.title = controller.rowLabelText;
                [self.navigationController pushViewController: controller animated: YES];
                [controller release];
            }
            break;
        default:
            break;
    }
}


@end
