//
//  MonthViewController.m
//  WaketheFup
//
//  Created by GOLD on 5/18/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "MonthViewController.h"
#import "DateViewController.h"
#import "MealSnapViewController.h"
#import "ClientLoginViewController.h"
#import "AboutViewController.h"

@interface MonthViewController ()

@property NSArray *monthArray;
@end

@implementation MonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //current year getting and displaying
    NSDate *today = [NSDate date];
    NSDateFormatter* timeformatter = [[NSDateFormatter alloc] init];
    timeformatter.dateFormat = @"yyyy";
    self.currentYearlbl.text = [timeformatter stringFromDate:today];
    
    //12 months button arrangement
    _monthArray = @[@"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN", @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC"];
    self.monthBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    for (int i = 0 ; i < 3 ; i ++) {
        for (int j = 0 ; j < 4 ; j ++) {
            self.monthBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [self.monthBtn setFrame:CGRectMake(42 + i *113, 251 + j * 75, 65, 30)];
            self.monthBtn.backgroundColor = [UIColor blackColor];
            [self.monthBtn setTitle:[_monthArray objectAtIndex:(i + j * 3)] forState:UIControlStateNormal];
            [self.monthBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [self.monthBtn setTag:(i + j * 3)];
            [self.monthBtn addTarget:self action:@selector(monthClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:self.monthBtn];
        }
    }
}

- (IBAction)monthClick:(UIButton*)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DateViewController *dateVC = [storyboard instantiateViewControllerWithIdentifier:@"DateViewController"];
    
    //current month and year return
    dateVC.selectedMonth = [sender tag] + 1;
    dateVC.selectedYear = [self.currentYearlbl.text integerValue];
    [self.navigationController pushViewController:dateVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)snapBtn:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MealSnapViewController *mealSnapVC = [storyboard instantiateViewControllerWithIdentifier:@"MealSnapViewController"];
    [self.navigationController pushViewController:mealSnapVC animated:YES];
}

- (IBAction)loginBtn:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ClientLoginViewController *clientLoginVC = [storyboard instantiateViewControllerWithIdentifier:@"ClientLoginViewController"];
    [self.navigationController pushViewController:clientLoginVC animated:YES];
}

- (IBAction)backBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)aboutBtnClicked:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AboutViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:aboutVC animated:YES];
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
