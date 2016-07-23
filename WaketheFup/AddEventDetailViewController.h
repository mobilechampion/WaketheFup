//
//  AddEventDetailViewController.h
//  WaketheFup
//
//  Created by black on 4/20/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventDetailViewController : UIViewController<UITextFieldDelegate>
- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;
- (IBAction)addBtnClicked:(id)sender;
- (IBAction)cancelBtnClicked:(id)sender;
- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;

- (IBAction)startTimeBtn:(id)sender;
- (IBAction)endTimeBtnClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *startTimeBtn;
@property (strong, nonatomic) IBOutlet UIButton *endTimeBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;

@property (strong, nonatomic) IBOutlet UILabel *startTimeLabel;

@property (strong, nonatomic)   UIDatePicker *datePicker;

@end
