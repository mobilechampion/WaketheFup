//
//  DateViewController.m
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "DateViewController.h"
#import "AboutViewController.h"
#import "AppDelegate.h"
#import "AddEventDetailViewController.h"
#import "ClientLoginViewController.h"
#import "MealSnapViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) CalendarView *calendarView;

@end

@implementation DateViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    self.saveBtn.layer.cornerRadius = 5;
    
    CGRect frame = self.calenderView.frame;
    
    _calendarView = [[CalendarView alloc] initWithFrame:frame];
    _calendarView.delegate = self;
    
    NSDate *currentDate = [NSDate date];
    NSLog(@"Current Date = %@", currentDate);
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = self.selectedMonth;
    dateComponents.year = self.selectedYear;
    _calendarView.calendarDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    NSLog(@"Date = %@", _calendarView.calendarDate);
    
    [self.view addSubview:_calendarView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
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

- (IBAction)backBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)aboutBtnClicked:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AboutViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:aboutVC animated:YES];
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

- (IBAction)saveBtnClicked:(id)sender {
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *eventMonth;
    NSString *eventYear;
    NSString *eventDay;
    NSDateFormatter* timeformatter = [[NSDateFormatter alloc] init];
    
    if(self.selectedDate == nil)
    {
    
        self.selectedDate = [NSDate date];
    }
    
    timeformatter.dateFormat = @"yyyy";
    eventYear = [timeformatter stringFromDate:self.selectedDate];
    
    timeformatter.dateFormat = @"MM";
    eventMonth = [timeformatter stringFromDate:self.selectedDate];
    
    timeformatter.dateFormat = @"dd";
    eventDay = [timeformatter stringFromDate:self.selectedDate];
    
    
    NSString *eventDate;
    eventDate = [NSString stringWithFormat:@"%@%@%@%@%@",eventMonth , @":", eventDay, @":", eventYear];
//    delegate.eventDate = eventDate;
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddEventDetailViewController *addEventDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"AddEventDetailViewController"];
    [self.navigationController pushViewController:addEventDetailVC animated:YES];

}



#pragma  - CalendarDelegate protocol conformance

- (void)dayChangedToDate:(NSDate *)selectedDate{
    
    self.selectedDate = selectedDate;
    NSLog(@"dayChangedToDate %@(GMT)", selectedDate);
    
    
}

@end
