//
//  ViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *link;
//@property (weak, nonatomic) IBOutlet UITableView *link;
//@property (weak, nonatomic) IBOutlet UIButton *title;
//@property (weak, nonatomic) IBOutlet UITableView *link;
//@property (weak, nonatomic) IBOutlet UITableView *link;

- (IBAction)titleAction:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *navi;
@property (weak, nonatomic) IBOutlet UIButton *topic;
- (IBAction)topicMove:(UIButton *)sender;
@property (strong, nonatomic) NSNumber *SegmentID;


//- (IBAction)titleAction:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

 
    //create the segment control
    /**
    NSArray *options = [NSArray arrayWithObjects:@"First Year", @"Second Year", @"Third Year",@"Fourth Year", nil];
    UISegmentedControl* control = [[UISegmentedControl alloc] initWithItems:options];
    control.momentary = NO;
    //[[UISegmentedControl appearance] setContentPositionAdjustment:UIOffsetMake(0, 0) //forSegmentType:UISegmentedControlSegmentCenter barMetrics:UIBarMetricsDefault];
    control.frame = CGRectMake(35, 320, 250, 35);
    //add it to the navigation bar
    self.navigationItem.titleView = control;
    */
    
 
    
   
    
    
    _firstYear = [[NSArray alloc] initWithObjects:@"CSCI 1100", @"CSCI 1101", nil];
    _secondYear = [[NSArray alloc] initWithObjects:@"CSCI 2110",@"CSCI 2112",@"CSCI 2121",@"CSCI 2132",@"CSCI 2141", nil];
    _thirdYear = [[NSArray alloc] initWithObjects:@"CSCI 3110",@"CSCI 3120",@"CSCI 3130",@"CSCI 3154",@"CSCI 3171",nil];
    _fourthYear = [[NSArray alloc] initWithObjects:@"CSCI 4116",@"CSCI 4140", @"CSCI 4171",@"CSCI 4174", nil];
    _allYear = [[NSArray alloc] initWithObjects:@"CSCI 1100", @"CSCI 1101",@"CSCI 2110",@"CSCI 2112",@"CSCI 2121",@"CSCI 2132",@"CSCI 2141",@"CSCI 3110",@"CSCI 3120",@"CSCI 3130",@"CSCI 3154",@"CSCI 3171",@"CSCI 4116",@"CSCI 4140", @"CSCI 4171",@"CSCI 4174", nil];
    
    
    self.showData = _allYear;
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return number of rows in the section
    return [self.showData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"tableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [_showData objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
- (IBAction)titleAction:(id)sender {
    [UIView animateWithDuration:0.1 animations:^{
        self.title.transform = CGAffineTransformMakeTranslation(10, 0);}];
}
 */









- (IBAction)titleAction:(UISegmentedControl *)sender {
    switch (_navi.selectedSegmentIndex)
    {
        case 0:
            self.showData = _allYear;
            [self.link reloadData];
            _SegmentID = [NSNumber numberWithInt:0];
            break;
        case 1:
            self.showData = _firstYear;
            [self.link reloadData];
            _SegmentID = [NSNumber numberWithInt:1];
            break;
        case 2:
            self.showData = _secondYear;
            [self.link reloadData];
            _SegmentID = [NSNumber numberWithInt:2];
            break;
        case 3:
            self.showData = _thirdYear;
            [self.link reloadData];
            _SegmentID = [NSNumber numberWithInt:3];
            break;
        case 4:
            self.showData = _fourthYear;
            [self.link reloadData];
            _SegmentID = [NSNumber numberWithInt:4];
            break;
        default:
            break;
    }
}
- (IBAction)topicMove:(UIButton *)sender {
    [UIView animateWithDuration:0.1 animations:^{
        self.topic.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
        // Step 2
        [UIView animateWithDuration:0.1 animations:^{
            self.topic.transform = CGAffineTransformMakeTranslation(-10, 0);
        } completion:^(BOOL finished) {
            // Step 3
            [UIView animateWithDuration:0.1 animations:^{
                self.topic.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
        }];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    delegate.SegmentID = self.SegmentID;
    NSIndexPath *path = [self.link indexPathForSelectedRow];
    delegate.CellID = path.row;
    if(_SegmentID == [NSNumber numberWithInt:0]){
        delegate.CellName = [NSString stringWithString:[_allYear objectAtIndex:path.row]];
    }
    else if(_SegmentID == [NSNumber numberWithInt:1]){
        delegate.CellName = [NSString stringWithString:[_firstYear objectAtIndex:path.row]];
    }
    else if(_SegmentID == [NSNumber numberWithInt:2]){
        delegate.CellName = [NSString stringWithString:[_secondYear objectAtIndex:path.row]];
    }
    else if(_SegmentID == [NSNumber numberWithInt:3]){
        delegate.CellName = [NSString stringWithString:[_thirdYear objectAtIndex:path.row]];
    }
    else if(_SegmentID == [NSNumber numberWithInt:4]){
        delegate.CellName = [NSString stringWithString:[_fourthYear objectAtIndex:path.row]];
        
    }
}

@end
