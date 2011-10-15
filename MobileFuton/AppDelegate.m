//
//  AppDelegate.m
//  MobileFuton
//
//  Created by Dale Harvey on 30/09/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#define dbName @"mobilefuton"

@implementation AppDelegate

@synthesize window = _window;
@synthesize serverURL = _serverURL;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window.rootViewController = self.viewController;
    //[self.window makeKeyAndVisible];
    
    CouchbaseMobile* cb = [[CouchbaseMobile alloc] init];
    cb.delegate = self;
    
    NSString* dbPath = [[NSBundle mainBundle] pathForResource: dbName ofType: @"couch"];
    [cb installDefaultDatabase: dbPath];
    
    NSAssert([cb start], @"Couchbase didn't start! Error = %@", cb.error); 
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void)couchbaseMobile:(CouchbaseMobile*)couchbase didStart:(NSURL*)serverURL {
        
    NSLog(@"Couchbase is Ready, go! %@", serverURL);
    
    _serverURL = serverURL;
        
    NSURLRequest *couchURLRequest = [NSURLRequest requestWithURL:serverURL];
    [[_viewController webView] loadRequest:couchURLRequest];
    
}

-(void)couchbaseMobile:(CouchbaseMobile*)couchbase failedToStart:(NSError*)error {
    NSAssert(NO, @"Couchbase failed to initialize: %@", error);
}


@end
