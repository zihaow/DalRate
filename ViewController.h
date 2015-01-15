//
//  ViewController.h
//  DalRate
//
//  Created by Zihao Wu on 2015-01-15.
//  Copyright (c) 2015 Zihao Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *firstYear;
@property (strong, nonatomic) NSArray *secondYear;
@property (strong, nonatomic) NSArray *thirdYear;
@property (strong, nonatomic) NSArray *fourthYear;
@property (strong, nonatomic) NSArray *allYear;
@property (strong, nonatomic) NSArray *showData;
//@property (weak, nonatomic) IBOutlet UILabel *easy;
//@property (weak, nonatomic) IBOutlet UILabel *qual;

@end

