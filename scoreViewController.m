//
//  scoreViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "scoreViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "TFHpple.h"

@interface scoreViewController ()


@property (strong, nonatomic) NSString *viewTitle;
@property (nonatomic) NSInteger CellID;
@property (nonatomic) double easiness;
@property (nonatomic) double quality;
@property (nonatomic, strong) NSTimer *mytimer;
@property (nonatomic, strong) NSTimer *mytimer2;
@property (nonatomic) double EASY;
@property (nonatomic) double QUAL;
@property (weak, nonatomic) IBOutlet UIImageView *bg;
//@property (strong, nonatomic) NSNumber *SegmentID;

@end

@implementation scoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    _easiness = 0.0;
    _quality = 0.0;

    _mytimer = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                                target:self selector:@selector(easy:) userInfo:nil repeats:YES];
    
    _mytimer2 = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                                 target:self selector:@selector(qual:) userInfo:nil repeats:YES];
    [UIImageView animateWithDuration:3.5f animations:^{[_bg setAlpha:0.2f];}];
        
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    _viewTitle = [NSString stringWithFormat:@"%@", delegate.CellName];
    _CellID = delegate.CellID;
    self.title = _viewTitle;
    
    if([delegate.CellName caseInsensitiveCompare:@"CSCI 1100"] == NSOrderedSame){
        
        NSString *html1100=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1MV8FXFDqSOjD3A1b73WDzE_PAN9aw8uW1TfJbHxc5og/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        NSData *data1100=[html1100 dataUsingEncoding:NSUTF8StringEncoding];
        TFHpple *xpathParser1100 = [[TFHpple alloc] initWithHTMLData:data1100];
        
        /* get the easiness of the course. */
        NSArray *easy1100  = [xpathParser1100 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
        TFHppleElement *cs1100 = [easy1100 objectAtIndex:0];
        NSString *easi1100 = [cs1100 content];
        
        /* convert from string to double. */
        double easiness = [easi1100 doubleValue];
        
        _EASY = easiness;
        
        /* get the quality of the course. */
        NSArray *qual1100  = [xpathParser1100 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
        TFHppleElement *csq1100 = [qual1100 objectAtIndex:0];
        NSString *qua1100 = [csq1100 content];
        
        /* convert from string to double. */
        double quality = [qua1100 doubleValue];
        
        _QUAL = quality;
        [_bg setImage:[UIImage imageNamed: @"chem.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 1101"] == NSOrderedSame){
        
        NSString *html1101=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1QQolEOs50CjCl7oIAhXcwpoFgEGEIyY-PmBoFk4mjeg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        NSData *data1101=[html1101 dataUsingEncoding:NSUTF8StringEncoding];
        TFHpple *xpathParser1101 = [[TFHpple alloc] initWithHTMLData:data1101];
        
        /* get the easiness of the course. */
        NSArray *easy1101  = [xpathParser1101 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
        TFHppleElement *cs1101 = [easy1101 objectAtIndex:0];
        NSString *easi1101 = [cs1101 content];
        
        /* convert from string to double. */
        double easiness = [easi1101 doubleValue];
        
        _EASY = easiness;
        
        /* get the quality of the course. */
        NSArray *qual1101  = [xpathParser1101 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
        TFHppleElement *csq1101 = [qual1101 objectAtIndex:0];
        NSString *qua1101 = [csq1101 content];
        
        /* convert from string to double. */
        double quality = [qua1101 doubleValue];
        
        _QUAL = quality;
        [_bg setImage:[UIImage imageNamed: @"chem.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2110"] == NSOrderedSame){
        _EASY = 4.1;
        _QUAL = 4.7;
        [_bg setImage:[UIImage imageNamed: @"air.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2100"] == NSOrderedSame){
        _EASY = 4.1;
        _QUAL = 4.7;
        [_bg setImage:[UIImage imageNamed: @"henryfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2112"] == NSOrderedSame){
        _EASY = 4.0;
        _QUAL = 5.0;
        [_bg setImage:[UIImage imageNamed: @"320.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2121"] == NSOrderedSame){
        _EASY = 3.0;
        _QUAL = 4.0;
        [_bg setImage:[UIImage imageNamed: @"circle.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2132"] == NSOrderedSame){
        _EASY = 3.0;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"cntower.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2141"] == NSOrderedSame){
        _EASY = 2.5;
        _QUAL = 2.0;
        [_bg setImage:[UIImage imageNamed: @"coast.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3101"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.9;
        [_bg setImage:[UIImage imageNamed: @"henryside.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3110"] == NSOrderedSame){
        _EASY = 4.0;
        _QUAL = 4.5;
        [_bg setImage:[UIImage imageNamed: @"color.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3120"] == NSOrderedSame){
        _EASY = 1.6;
        _QUAL = 4.5;
        [_bg setImage:[UIImage imageNamed: @"dalinsun.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3121"] == NSOrderedSame){
        _EASY = 1.6;
        _QUAL = 4.5;
        [_bg setImage:[UIImage imageNamed: @"hi.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3130"] == NSOrderedSame){
        _EASY = 4.2;
        _QUAL = 3.5;
        [_bg setImage:[UIImage imageNamed: @"downtown.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3136"] == NSOrderedSame){
        _EASY = 4.2;
        _QUAL = 3.5;
        [_bg setImage:[UIImage imageNamed: @"hk.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3151"] == NSOrderedSame){
        _EASY = 3.5;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"landing.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3154"] == NSOrderedSame){
        _EASY = 3.5;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"fall.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3160"] == NSOrderedSame){
        _EASY = 3.5;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"look.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3161"] == NSOrderedSame){
        _EASY = 3.5;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"montreal.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3162"] == NSOrderedSame){
        _EASY = 3.5;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"night.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3171"] == NSOrderedSame){
        _EASY = 3.1;
        _QUAL = 4.2;
        [_bg setImage:[UIImage imageNamed: @"fenwick.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3172"] == NSOrderedSame){
        _EASY = 3.1;
        _QUAL = 4.2;
        [_bg setImage:[UIImage imageNamed: @"outlib.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3190"] == NSOrderedSame){
        _EASY = 3.1;
        _QUAL = 4.2;
        [_bg setImage:[UIImage imageNamed: @"road.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4112"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.8;
        [_bg setImage:[UIImage imageNamed: @"smu.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4116"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.8;
        [_bg setImage:[UIImage imageNamed: @"halifax.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4117"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.8;
        [_bg setImage:[UIImage imageNamed: @"somewhere.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4125"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.8;
        [_bg setImage:[UIImage imageNamed: @"tiffany.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4126"] == NSOrderedSame){
        _EASY = 2.7;
        _QUAL = 3.8;
        [_bg setImage:[UIImage imageNamed: @"tor.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4140"] == NSOrderedSame){
        _EASY = 5.0;
        _QUAL = 3.0;
        [_bg setImage:[UIImage imageNamed: @"henry.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4144"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"toronto.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4145"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"van.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4152"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"waterfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4155"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"window.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4160"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"wow.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4163"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"henryside.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4166"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"library.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4167"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"dalinsun.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4168"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"halifax.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4169"] == NSOrderedSame){
        _EASY = 3.9;
        _QUAL = 3.3;
        [_bg setImage:[UIImage imageNamed: @"landing.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4171"] == NSOrderedSame){
        _EASY = 3.1;
        _QUAL = 3.5;
        [_bg setImage:[UIImage imageNamed: @"henryf.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4174"] == NSOrderedSame){
        _EASY = 3.3;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"henryfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4176"] == NSOrderedSame){
        _EASY = 3.3;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"van.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4180"] == NSOrderedSame){
        _EASY = 3.3;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"hk.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4181"] == NSOrderedSame){
        _EASY = 3.3;
        _QUAL = 4.1;
        [_bg setImage:[UIImage imageNamed: @"chemistry.png"]];
    }
    
    // Do any additional setup after loading the view.
}

- (void) easy:(NSTimer *)timer {
    
    _easy.text = [NSString stringWithFormat:@"%.1f", _easiness];
    _easiness+= 0.1;
    if(_easiness >= _EASY){
        [_mytimer invalidate];
    }
}

- (void) qual:(NSTimer *)timer {
    
    _qual.text = [NSString stringWithFormat:@"%.1f", _quality];
    _quality += 0.1;
    if(_quality >= _QUAL){
        [_mytimer2 invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
