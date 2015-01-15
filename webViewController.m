//
//  webViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fullURL = @"https://docs.google.com/forms/d/1sc4ZdeGKR1qcMZ0VpMSCokUHE256LZvYO73W_MM5Rrk/viewform";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
    // Do any additional setup after loading the view.
}



@end
