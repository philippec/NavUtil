//
//  FirstSectionDetail.h
//  NavUtil
//
//  Created by Philippe on 11-03-19.
//  Copyright 2011 Philippe Casgrain. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstSectionDetailController : UIViewController {
    IBOutlet UILabel *rowLabel;
    NSString *_rowLabelText;
}

@property (nonatomic, copy) NSString *rowLabelText;

- (IBAction) allRight: (id) sender;

@end
