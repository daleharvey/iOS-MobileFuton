//
//  AppDelegate.h
//  MobileFuton
//
//  Created by Dale Harvey on 30/09/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Couchbase/CouchbaseMobile.h>

#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, CouchbaseDelegate> {
    UIWindow *window;
}

@property (strong, nonatomic) NSURL *serverURL;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) ViewController *viewController;

@end
