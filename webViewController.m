//
//  webViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "webViewController.h"
#import "AppDelegate.h"

@interface webViewController ()

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 1100"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1eljdAEgLKX3gkJ6Doj38B2A0cYcCJC7dMy8aaCHQ_sE/viewform";
        NSLog(@"oppppppppss.");
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 1101"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1V9QgLi3v-XoDGYHTt61hnN3Qjc4hkf7MKxKN1dTSGtc/viewform";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    /*
    NSString *fullURL = @"https://docs.google.com/forms/d/1sc4ZdeGKR1qcMZ0VpMSCokUHE256LZvYO73W_MM5Rrk/viewform";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
     */
    // Do any additional setup after loading the view.
}



@end
