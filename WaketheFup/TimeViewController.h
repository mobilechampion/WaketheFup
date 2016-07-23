//
//  TimeViewController.h
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MGConferenceDatePicker.h"
#import "MGConferenceDatePickerDelegate.h"
@interface TimeViewController : UIViewController<MGConferenceDatePickerDelegate>
- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;
- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;


@property (strong, nonatomic) IBOutlet UIView   *pickerView;
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;
@end
