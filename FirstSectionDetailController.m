//
//  FirstSectionDetail.m
//  NavUtil
//
//  Created by Philippe on 11-03-19.
//  Copyright 2011 Philippe Casgrain. All rights reserved.
//

#import "FirstSectionDetailController.h"


@implementation FirstSectionDetailController

@synthesize rowLabelText = _rowLabelText;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    rowLabel.text = self.rowLabelText;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    self.rowLabelText = nil;
    [super dealloc];
}

- (IBAction) allRight: (id) sender
{
    [self.navigationController popViewControllerAnimated: YES];
}


@end
