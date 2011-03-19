//
//  NavUtilAppDelegate.h
//  NavUtil
//
//  Created by Philippe on 11-03-19.
//  Copyright 2011 Philippe Casgrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface NavUtilAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

