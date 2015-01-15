//
//  scoreViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "scoreViewController.h"
#import "AppDelegate.h"


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
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
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
    
    // Do any additional setup after loading the view.
}




/**
    if([courseName isEqualToString:@"CSCI 1100"]){
        _EASY = 4.5;
        _QUAL = 4.1;
    }
   */


- (void) easy:(NSTimer *)timer {
    
    _easy.text = [NSString stringWithFormat:@"%.1f", _easiness];
    _easiness+= 0.1;
    if(_easiness >= 4.3){
        [_mytimer invalidate];
    }
}

- (void) qual:(NSTimer *)timer {
    
    _qual.text = [NSString stringWithFormat:@"%.1f", _quality];
    _quality += 0.1;
    if(_quality >= 3.4){
        [_mytimer2 invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
