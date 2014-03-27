//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Justin Steffen on 3/27/14.
//  Copyright (c) 2014 Justin Steffen. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void) setURL:(NSURL *)URL {
    _URL = URL;
    
    if (_URL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:request];
    }
}

#pragma mark UISplitViewControllerDelegate
- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc {
    barButtonItem.title = @"Courses";
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

@end
