//
//  DateViewController.h
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarView.h"

@interface DateViewController : UIViewController<CalendarDelegate>

@property (strong, nonatomic) IBOutlet UIView       *calenderView;
@property (strong, nonatomic) IBOutlet UIButton     *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton     *clientLoginBtn;
@property (strong, nonatomic) IBOutlet UIButton     *saveBtn;

@property (nonatomic, assign)          NSInteger         selectedYear;
@property (nonatomic, assign)          NSInteger         selectedMonth;
@property (strong, nonatomic)          NSDate       *selectedDate;


- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;
- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;
- (IBAction)saveBtnClicked:(id)sender;


@end
