//
//  ViewController.h
//  MobileFuton
//
//  Created by Dale Harvey on 30/09/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
}

-(void)loadWebView;

@property (strong, nonatomic) UIWebView *webView;

@end
