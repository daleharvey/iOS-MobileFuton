//
//  ViewController.m
//  MobileFuton
//
//  Created by Dale Harvey on 30/09/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"

@implementation ViewController

@synthesize webView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"in viewDidLoad");
    [super viewDidLoad];
    
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = contentView;
    
    CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
    webFrame.origin.y -= 20.0;
    
    webView = [[UIWebView alloc] initWithFrame:webFrame]; 
    webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    webView.scalesPageToFit = YES;
    webView.delegate = self;

    //NSURL *serverURL = [NSURL URLWithString:@"http://google.com/"];
    //NSURLRequest *requestObj = [NSURLRequest requestWithURL:serverURL];
    //[webView loadRequest:requestObj];
    
    [self.view addSubview: webView];

}

- (void)loadWebView
{
    NSLog(@"in LoadWebView");
    
    NSURL *serverURL = [NSURL URLWithString:@"http://yahoo.com/"];
    //NSURL *serverURL = [delegate.serverURL URLByAppendingPathComponent:@"mobilefuton/_design/mobilefuton/index.html"];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:serverURL];
    [webView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
    
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
