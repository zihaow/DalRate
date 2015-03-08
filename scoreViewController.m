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
//#import "Reachability.h"

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
@property (strong, nonatomic) IBOutlet UIButton *sub;
- (IBAction)submit:(UIButton *)sender;
- (IBAction)submit2:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *sub2;

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
        
        double localE = 0.0;
        double localQ = 0.0;
        
        //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        //NSArray *fakeFavs = [[ NSArray alloc] initWithObjects:[NSNumber numberWithFloat:localE],[NSNumber numberWithFloat:localQ],nil];
        //NSArray *fakeFavs;
        //[prefs setObject:fakeFavs forKey:@"favourites"];
        
        //NSMutableArray *favorites = [prefs arrayForKey:@"favourites"];
        //NSLog(@"*****this is %@\n",favorites[0]);
        
        NSString *html1100=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1MV8FXFDqSOjD3A1b73WDzE_PAN9aw8uW1TfJbHxc5og/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        
        if (html1100 == nil){
            NSLog(@"Connection Failed\n");
            //NSAlert *alert = [NSAlert alertWithMessageText:@"Delete the record?";
            //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            //NSArray *favorites = [prefs arrayForKey:@"favourites"];
            //NSString *textToLoad = [prefs stringForKey:@"keyToFindText"];
            //NSLog(@"*****this is %@\n",fakeFavs[0]);
            if(localE != 0.0){
                _EASY = 0.0;
            }
            else{
                _EASY = 0.0;
                NSLog(@"No data.\n");
            }
            if(localQ != 0.0){
                _QUAL = localQ;
            }
            else{
               _QUAL = 0.0;
            }
        }
        else{
            NSLog(@"Connection Successful\n");
            NSData *data1100=[html1100 dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser1100 = [[TFHpple alloc] initWithHTMLData:data1100];
        
            /* get the easiness of the course. */
            NSArray *easy1100  = [xpathParser1100 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs1100 = [easy1100 objectAtIndex:0];
            NSString *easi1100 = [cs1100 content];
        
            /* convert from string to double. */
            double easiness = [easi1100 doubleValue];
        
            _EASY = easiness;
            //localE = easiness;
        
            /* get the quality of the course. */
            NSArray *qual1100  = [xpathParser1100 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq1100 = [qual1100 objectAtIndex:0];
            NSString *qua1100 = [csq1100 content];
        
            /* convert from string to double. */
            double quality = [qua1100 doubleValue];
        
            _QUAL = quality;
            //localQ = quality;
            //NSLog(@"easiness is. %f\n",localE);
            
            //fakeFavs = [[ NSArray alloc] initWithObjects:[NSNumber numberWithFloat:localE],[NSNumber numberWithFloat:localQ],nil];
            //NSLog(@"this is %@\n",fakeFavs[0]);
        }
        //NSLog(@"***this is %@\n",fakeFavs[0]);
        [_bg setImage:[UIImage imageNamed: @"chem.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 1101"] == NSOrderedSame){
        
        NSString *html1101=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1QQolEOs50CjCl7oIAhXcwpoFgEGEIyY-PmBoFk4mjeg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        
        if (html1101 == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }
        else{
            NSData *data1101=[html1101 dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser1101 = [[TFHpple alloc] initWithHTMLData:data1101];
            NSArray *easy1101  = [xpathParser1101 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs1101 = [easy1101 objectAtIndex:0];
            NSString *easi1101 = [cs1101 content];
            double easiness = [easi1101 doubleValue];
            _EASY = easiness;
            NSArray *qual1101  = [xpathParser1101 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq1101 = [qual1101 objectAtIndex:0];
            NSString *qua1101 = [csq1101 content];
            double quality = [qua1101 doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"chem.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2110"] == NSOrderedSame){
        NSString *html2110=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1uBbfQwlQ3y9leCmS1wYkK8-cN48GnxO54v2411oHtmg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        
        if (html2110 == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data2110=[html2110 dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser2110 = [[TFHpple alloc] initWithHTMLData:data2110];
            NSArray *easy2110  = [xpathParser2110 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs2110 = [easy2110 objectAtIndex:0];
            NSString *easi2110 = [cs2110 content];
            double easiness = [easi2110 doubleValue];
            _EASY = easiness;
            NSArray *qual2110  = [xpathParser2110 searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq2110 = [qual2110 objectAtIndex:0];
            NSString *qua2110 = [csq2110 content];
            double quality = [qua2110 doubleValue];
            _QUAL = quality;
        }
        [_bg setImage:[UIImage imageNamed: @"air.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2100"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/12OAkUpjFl7t0wSUkBNUcgcKnw7yazk1uoX0JnkdPwZQ/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henryfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2112"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1UbDtImuyu5StOql2b-IxaQ80Nq08sJ_VSGlXK825brc/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        [_bg setImage:[UIImage imageNamed: @"320.png"]];
    }
    
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2121"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1ZqydmV8I-PQw-Tc6WwQqwL9mS2peNTGvOS2956MXxwo/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"circle.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2132"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1oRUCEipTlNFsMIsBUhqjsd47ooyT2j7uE_Me59Q4yOs/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"cntower.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 2141"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1X-piZheLhZRwB83pb7vaDuKlelCV_bETO3ooJWO2xDI/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        [_bg setImage:[UIImage imageNamed: @"coast.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3101"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1el6U0YpHqHgn3NVKG1JZLg6mSnJ3MWUPHl7ZPF7IiZc/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henryside.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3110"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1l_kMoAl_Pi72pM_ZH_x6Ul1r7DKjPvy0WWBPT2PdfqI/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"color.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3120"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1gbuj2qMCcvqtdLAWSApar80f4xcei-KnnraHEzyMkb8/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"dalinsun.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3121"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1Sjp3pkaKdVE02r5XZIRehp94FdhGJ1TPo_UTHWY5G8U/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"downtown.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3130"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1qvQ3250ituOmgCYTSf4rWy_oUAfl2Y6k3yGZwXMrMY0/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"hi.png"]];
    }
    
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3132"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1BmWF8NxlzyfVq1hHVLGbT6-h33HkYahI3wYGYG-uV6c/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"hi.png"]];
    }
    
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3136"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1slgNZvlqid0pPtZP51pNtSuDnAWAK7uXwP6XNpR-GP0/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"hk.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3151"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/13hzQwe7QBaGADUeoeyqmPPSCHdsyCZXYy6nCPKXOcLI/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"landing.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3154"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/12t17stGRjh4pFeXNb_eg2YmKYRZigtK5MoqNDsfOEZo/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"fall.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3160"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1nAZsxk-jF1Mzq-vuxo6LKQd1okUWi5n0L7wiD1fYBTI/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"look.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3161"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1QuAg9s-ggg8ul4pxCdkMTJgtPP5CvAk_Ku84po3e2GI/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"montreal.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3162"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1wwV7mBYdLt7-TQ4CwIzYVZQU8uLN6DmA6QSYGmJVbS4/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        [_bg setImage:[UIImage imageNamed: @"night.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3171"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1Q6PZvch9niDE455kwRxwteM4RGCfoP5Q8ZewEVHc4sY/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"fenwick.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3172"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1Lv9GUHVR_bdcLcuywZTpxeVG3HJ5NZ5NEahSDkXzhMg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"outlib.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 3190"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1bmV668vidjV1NNJ10msN6wJI8XgPCkeAQubN8vACIlA/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"road.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4112"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1_ucuXqiC0eoguhInZOQ3k-4JeDlbPtWJ6lxbJM0OVFA/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"smu.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4116"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1o-mVMU4-lPsbKTC7PI3cq6bv9Ms1eiH2Yp7oxEIUlnY/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"halifax.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4117"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1dtmrAKTa9pruc5RvLD75w_JgMRPlFx3AzmQUQiqiIm0/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"somewhere.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4125"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1bIJ6YGu1at9vaa1of9PAVU7Qz0OtAfl89FlYwLNFvZE/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"tiffany.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4126"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1qsZaoccB2rk83-Dcu1davzx1D3vn9A0v4dHG371oyVo/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"tor.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4140"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1xpzYAvE_sjhKAlpOZ4VHdaZbWb_AwiZbwn5f0IEsKks/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henry.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4144"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1_uGX4gJXl-OxBW_d4MqkXDy1nuMAgvxswatvqGK5Eqg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"toronto.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4145"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1M_m4t-bPCqrkOq-O0Ww7y8poDvsm1wfP9Jwgo2vk3Vg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"van.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4152"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1KkZpWm7YqBFASVplbFk8t9cLOmBwNdzH4xnwYfkY7NY/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"waterfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4155"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1F1JycROfb0Aq1h7asAxOWNUzAIDwwQ-6N7grFg8D8tc/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"window.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4160"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1_xC4XIOyGqEFOehiav1DNi7fhNMecyb62Oq_8whKh1s/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"wow.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4163"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/17b1504XuCjc5mm3M0kjt-nOzbGcBno8QtS0h0TH51Pk/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henryside.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4166"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1H8NI0ZR4lzziDCJr5HY6EbgzHRwJ-qbBaqDIyx6dA2Y/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"library.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4167"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1WKuVYJvHDHWpdMNRbJXy_shEYFDeqDtx7Gs0LURkXZs/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"dalinsun.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4168"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/18D4Gu7Io4bvvJq1Yb7e8MWi7NeknCDxFTINrnzAO3-E/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"halifax.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4169"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1iXuZsURE-95GKPJ_wMUGXV_VZQEHyeEhH-znUrFWHQ4/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"landing.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4171"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1JD0kBvjMBVfhkjZiz-WN8IRX-1qTkLvrN6GOWrYbXHA/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henryf.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4174"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1K5kmjmiyC-TPeGn0GwsxpDDQGcqJfwaXUk15l-Crjqw/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"henryfront.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4176"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1m4tFdA_nprUkpNASqUjUXTaMGJbdTIZ4m8WKanBVwDg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        [_bg setImage:[UIImage imageNamed: @"van.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4180"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1B_InSDI4GDDfb4p3ZCpxAeilhrEPgZiu_W7T2BlTYgo/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
        [_bg setImage:[UIImage imageNamed: @"hk.png"]];
    }
    else if ([delegate.CellName caseInsensitiveCompare:@"CSCI 4181"] == NSOrderedSame){
        NSString *html=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://docs.google.com/spreadsheets/d/1dwG-zcHhxP_4fG0AZs1Lya5ImyDUxS9kfjdr3WL0JEg/pubhtml"] encoding: NSUTF8StringEncoding error:nil];
        if (html == nil){
            NSLog(@"Connection Failed\n");
            _EASY = 0.0;
            _QUAL = 0.0;
        }else{
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
            NSArray *easy  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[5]"];
            TFHppleElement *cs = [easy objectAtIndex:0];
            NSString *easi = [cs content];
            double easiness = [easi doubleValue];
            _EASY = easiness;
            NSArray *qual  = [xpathParser searchWithXPathQuery:@"/html/body/div[2]/div/div/table/tbody/tr[3]/td[6]"];
            TFHppleElement *csq = [qual objectAtIndex:0];
            NSString *qua = [csq content];
            double quality = [qua doubleValue];
            _QUAL = quality;
        }
        
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



- (IBAction)submit:(UIButton *)sender {
        [UIView animateWithDuration:0.1 animations:^{
            self.sub.transform = CGAffineTransformMakeTranslation(10, 0);
        } completion:^(BOOL finished) {
            // Step 2
            [UIView animateWithDuration:0.1 animations:^{
                self.sub.transform = CGAffineTransformMakeTranslation(-10, 0);
            } completion:^(BOOL finished) {
                // Step 3
                [UIView animateWithDuration:0.1 animations:^{
                    self.sub.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }];
        }];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSArray *fakeFavs = [[ NSArray alloc] initWithObjects:[NSNumber numberWithFloat:3.4],[NSNumber numberWithFloat:1.2],nil];
        [prefs setObject:fakeFavs forKey:@"favourites"];
        NSArray *favorites = [prefs arrayForKey:@"favourites"];
        NSLog(@"*****this is %@\n",favorites[0]);
        if(fakeFavs[0] != nil){
            _sub.enabled = _sub.enabled = NO;
            _sub.hidden = true;
            NSLog(@"OMG\n");
        }
    }

- (IBAction)submit2:(UIButton *)sender {
    //_sub2.hidden = true;
    [UIView animateWithDuration:0.1 animations:^{
        self.sub2.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
        // Step 2
        [UIView animateWithDuration:0.1 animations:^{
            self.sub2.transform = CGAffineTransformMakeTranslation(-10, 0);
        } completion:^(BOOL finished) {
            // Step 3
            [UIView animateWithDuration:0.1 animations:^{
                self.sub2.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
        }];
    }];
}



@end
