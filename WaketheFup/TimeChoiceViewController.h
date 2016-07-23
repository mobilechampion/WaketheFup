//
//  TimeChoiceViewController.h
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeChoiceViewController : UIViewController
- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;
- (IBAction)alarmClockBtnClicked:(id)sender;
- (IBAction)calendarBtnClicked:(id)sender;
- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *alarmClockBtn;
@property (strong, nonatomic) IBOutlet UIButton *calendarBtn;
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;







@end
