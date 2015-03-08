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
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2100"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1vouujQtOuvp2WmRCAbKSD9Q5f_OJEA0kStKfQ9NTCEg/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2110"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1SADId3kzSd8rbxdY08hxwUE8B5-3zlT8isAZS0SE_m0/edit";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2112"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1vSNMh8a6mRm6oNHFDJL7Yz7MKNnPNAkkk1y_YipXnMA/edit";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2121"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1P-o6EyIZaKKRvFv4EsJiXX8U3HinMU2cRRI-nOOUQ6E/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2132"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/11SwDFeWais5tlqTQjhfeUOlbcoCgTeGfV2iODYodYZI/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 2141"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/16loBmaWgurEOmUD20JEVYzn-9hbTaxa0_AMBE_F72TQ/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3101"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1QjUJhSG5wuebF-p9EcEUm6wdMb4wtVBAI48xM6fOcI8/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3110"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1_zZuEi3UXnQ0txCs1_gyVDUtjwHwSLb8H_Ni8GgKDVI/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3120"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1MwhPbGUWZRBEdEml-5IYLwx2si09fiJHJ9Z8s8IU2Vo/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3121"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1rdbT7B6M7_uzl5vccCFTvVp7XdrTv7dd0V3j3ec2Z-U/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3130"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1Vsh9AB_lMpupeGZD39f6_MakQoWlY81vUklhEVekpEc/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3132"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1tRtnElH71M3-4ZWK41aSTCaUIyYbkmspEpxw_J4-8qg/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3136"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1mOWd1Sh1J2kbph9jvGdG0A0mfYu2zczpJ6KEq82acRk/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3151"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/13Jrw50omHUNg0IGlj0Vb170rWLdexJvAb7ql8q7dNmg/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3154"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1xmSdAwQUdvbL_u47caRryI9Uew0PsAmRRCS6qQr0jEs/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3160"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1fb1NPAMpzxSlGIUnX75RxHuyHBAmyMe1K0t8qJK0FwU/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3161"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1POdzU-Hob5QTc0pioIoGpPKICoSxBSdSftbp__Dd5N0/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3162"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/17usA6qP56D0lIlix7xqp5B9IL00Cj-MtUMdCjpT_pLA/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3171"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1uIcjlIuk9zKDgkMWB_KG4OX-TkxMjK_DxhPKJgyzF1g/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3172"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1wh82EMqC2_f2dXQOznsJ3aKFtRnVEEwlfPwTIxPFNKg/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 3190"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1W82LihgfLZ2NXYAYMh_s1pxtI-L7ODXExAb7NNw7njA/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4112"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1fEGc7HwDUw1a791xtqnpqbCDBG5-pd0Q-3WCnyAPESw/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4116"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1gswKK0rR-8VuTjMg0jIqNnIZOEbFbLDRxultxJVTVIY/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4117"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1FQU3cEA-uXHgw58lnTbI7Yf2KpKf6I3DPp1MO0YKpk4/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4125"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1pmzRkTZ0XX97E4771weWERz0BAs1c9wRXkXufqp0abw/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4126"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1ED6rt0xwLpcCs2esSVy0V3NDt_qarQEqLwOnJabS7CY/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4140"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1-mtZpmO4DN9qCsj4bfM8cWBeUojcJM7ahg3Pf__4-wA/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4144"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1foad0DPHIaq3gCtj3jF1YhM81jx7GV9PK-5_ATjlSB8/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4145"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/14lS5TER2TY-6kG7IuoG1qTFGHlTzxzosdgtRrAOAUwc/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4152"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1XILR--4dOyYMnLjSaO7N6U_L1ZhjeAzxx9yaEFYe0ug/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4155"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/14_mersEfiPVmPDCfLFcvgxjVPxHUqRRpXtycRiPMAC8/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4160"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1QS0JfbrC0AFlr73R3uuZejN0tVp3aYSK7F9sx3wt78I/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4163"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1FIjDhYfsSQGUhd15VxZdWN0USq3pyD3QVVD7drc7ABQ/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4166"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1Dj_s9ThOWlxLpqYdunVKhe_-kkpnVkBGs6KL7Ql7HmM/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4167"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1ygyJxd3GaGKJE3FTKIq9fp-zAFVrFXX9tzwsvlgctCI/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4168"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1qI_m2_2-JGnWSNnGE_v3mFd-aJb1CkoevMeoj4a4rqk/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4169"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1an2-EFUlNciKgDz9oyk1h58NqmpbTW5mlyPMogJq3j4/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4171"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1B9YY83B3FPn-vnJ5jDIyRQqcm0Zj4mWVOAFVGl_QN6w/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4174"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/10ekzBrRqbxAgHeVR6ltQItTqh1UmltD15prnG0mfVlk/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4176"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/12Ydi_qFFejv_ppKfCz_J7JKJAJ5vXJ6XP7_xgWy-MxE/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4180"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1Wgo8lG3v-X2_ZMnBxPWU4gakeKFPXz1Q-B0HG6Zofr8/viewform?usp=send_form";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 4181"] == NSOrderedSame){
        NSString *fullURL = @"https://docs.google.com/forms/d/1rVWDJGsf1wSghAafbaSv9tsQN4EIeTeM8yYGDW50M3s/viewform?usp=send_form";
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
