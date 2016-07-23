//
//  TimeViewController.m
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "TimeViewController.h"
#import "AboutViewController.h"
#import "ClientLoginViewController.h"
#import "MealSnapViewController.h"
#import "AppDelegate.h"

@interface TimeViewController ()<customDelegate>

@end

@implementation TimeViewController

bool allowNotif;
bool allowsSound;
bool allowsBadge;
bool allowsAlert;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    
    MGConferenceDatePicker *datePicker = [[MGConferenceDatePicker alloc] initWithFrame:self.pickerView.bounds];
    [datePicker setDelegate:self];
    //OPTIONAL: Choose the background color
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    [self.pickerView addSubview:datePicker];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Delegate
-(void)conferenceDatePicker:(MGConferenceDatePicker *)datePicker saveDate:(NSDate *)date{
    NSLog(@"%@",[date description]);
   
//    [NSTimer scheduledTimerWithTimeInterval:10.0
//                                     target:self
//                                   selector:@selector(schedule:)
//                                   userInfo:nil repeats:NO];
    
    NSDateFormatter* timeformatter = [[NSDateFormatter alloc] init];
    
    timeformatter.dateFormat = @"hh";
    NSString *hour = [timeformatter stringFromDate:date];
    
    timeformatter.dateFormat = @"mm";
    NSString *minute = [timeformatter stringFromDate:date];
    
    NSString *eventTime;
    eventTime = [NSString stringWithFormat:@"%@%@%@",hour,@":",minute];
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = date;
    localNotification.alertBody = @"Mrooooooowwww";
    localNotification.timeZone = [NSTimeZone systemTimeZone];
    localNotification.repeatInterval = NSCalendarUnitDay;
    localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
//    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)displayDetail {
    NSString *title = @"";
    NSLog(@"////////////////");
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

- (IBAction)backBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)aboutBtnClicked:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AboutViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:aboutVC animated:YES];
    
}
@end
