//
//  ViewController.m
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TFHpple.h" 

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
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *height;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.topItem.title = @"Rate a course";
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    //self.title = @"Title of the Page";
    
    //self.navigationController.navigationBar
    /*
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"mplus-1c-regular" size:50],
      NSFontAttributeName, nil]];
    */
    _link.backgroundColor = [UIColor blackColor];
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    /* if user device is iPhone 4S, then adjust tableview height for better viewing experience. */
    if(screenHeight == 480){
      _height.constant = 310;
    }
    
    /* if user device is iPhone 5 or iPhone 5S, then adjust tableview height for better viewing experience. */
    if(screenHeight == 568){
        _height.constant = 400;
    }
    
    /* if user device is iPhone 6 plus, then adjust tableview height for better viewing experience. */
    if(screenHeight == 736){
        _height.constant = 565;
        //NSLog(@"height is %f", screenHeight);
    }
    
    _firstYear = [[NSArray alloc] initWithObjects:@"CSCI 1100", @"CSCI 1101", nil];
    _secondYear = [[NSArray alloc] initWithObjects:@"CSCI 2100",@"CSCI 2110",@"CSCI 2112",@"CSCI 2121",@"CSCI 2132",@"CSCI 2141", nil];
    _thirdYear = [[NSArray alloc] initWithObjects:@"CSCI 3101",@"CSCI 3110",@"CSCI 3120",@"CSCI 3121",@"CSCI 3130",@"CSCI 3132",@"CSCI 3136",@"CSCI 3151",@"CSCI 3154",@"CSCI 3160",@"CSCI 3161",@"CSCI 3162",@"CSCI 3171",@"CSCI 3172",@"CSCI 3190",nil];
    _fourthYear = [[NSArray alloc] initWithObjects:@"CSCI 4112",@"CSCI 4116",@"CSCI 4117",@"CSCI 4125",@"CSCI 4126",@"CSCI 4140", @"CSCI 4144",@"CSCI 4145",@"CSCI 4152",@"CSCI 4155",@"CSCI 4160",@"CSCI 4163",@"CSCI 4166",@"CSCI 4167",@"CSCI 4168",@"CSCI 4169",@"CSCI 4171",@"CSCI 4174",@"CSCI 4176",@"CSCI 4180",@"CSCI 4181", nil];
    _allYear = [[NSArray alloc] initWithObjects:@"CSCI 1100", @"CSCI 1101",@"CSCI 2100",@"CSCI 2110",@"CSCI 2112",@"CSCI 2121",@"CSCI 2132",@"CSCI 2141",@"CSCI 3101",@"CSCI 3110",@"CSCI 3120",@"CSCI 3121",@"CSCI 3130",@"CSCI 3132",@"CSCI 3136",@"CSCI 3151",@"CSCI 3154",@"CSCI 3160",@"CSCI 3161",@"CSCI 3162",@"CSCI 3171",@"CSCI 3172",@"CSCI 3190",@"CSCI 4112",@"CSCI 4116",@"CSCI 4117",@"CSCI 4125",@"CSCI 4126",@"CSCI 4140", @"CSCI 4144",@"CSCI 4145",@"CSCI 4152",@"CSCI 4155",@"CSCI 4160",@"CSCI 4163",@"CSCI 4166",@"CSCI 4167",@"CSCI 4168",@"CSCI 4169",@"CSCI 4171",@"CSCI 4174",@"CSCI 4176",@"CSCI 4180",@"CSCI 4181", nil];
    
    
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
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    /* Animate the table view reload */
    [UIView transitionWithView: self.link
                      duration: 0.75f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void)
     {
         [self.link reloadData];
     }
                    completion: ^(BOOL isFinished)
     {
         /* TODO: Whatever you want here */
     }];
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
    delegate.CellName = [NSString stringWithString:[_allYear objectAtIndex:path.row]];
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

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
    //return UIStatusBarStyleDefault
}

@end
