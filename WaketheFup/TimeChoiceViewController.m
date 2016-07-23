//
//  TimeChoiceViewController.m
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "AppDelegate.h"
#import "TimeChoiceViewController.h"
#import "TimeViewController.h"
#import "DateViewController.h"
#import "AboutViewController.h"
#import "MonthViewController.h"
#import "MealSnapViewController.h"
#import "ClientLoginViewController.h"

@interface TimeChoiceViewController ()

@end

@implementation TimeChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.alarmClockBtn.layer.cornerRadius = 5;
    self.calendarBtn.layer.cornerRadius = 5;
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mealSnapBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MealSnapViewController *mealSnapVC = [storyboard instantiateViewControllerWithIdentifier:@"MealSnapViewController"];
    [self.navigationController pushViewController:mealSnapVC animated:YES];
}

- (IBAction)clientLoginBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ClientLoginViewController *clientLoginVC = [storyboard instantiateViewControllerWithIdentifier:@"ClientLoginViewController"];
    [self.navigationController pushViewController:clientLoginVC animated:YES];

}

- (IBAction)alarmClockBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TimeViewController *timeVC = [storyboard instantiateViewControllerWithIdentifier:@"TimeViewController"];
    [self.navigationController pushViewController:timeVC animated:YES];
}



- (IBAction)calendarBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MonthViewController *monthVC = [storyboard instantiateViewControllerWithIdentifier:@"MonthViewController"];
    [self.navigationController pushViewController:monthVC animated:YES];
}

- (IBAction)backBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)aboutBtnClicked:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AboutViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:aboutVC animated:YES];
    

}
@end
