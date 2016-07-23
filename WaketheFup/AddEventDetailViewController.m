//
//  AddEventDetailViewController.m
//  WaketheFup
//
//  Created by black on 4/20/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "AddEventDetailViewController.h"
#import "AboutViewController.h"
#import "DateViewController.h"
#import "MealSnapViewController.h"
#import "ClientLoginViewController.h"
#import "TimeViewController.h"
#import "AppDelegate.h"

@interface AddEventDetailViewController ()<UIPopoverControllerDelegate>



@end

@implementation AddEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.cancelBtn.layer.cornerRadius = 5;
    self.addBtn.layer.cornerRadius = 5;
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    
    self.titleTextField.text = @"";
    self.locationTextField.text = @"";
    
    self.titleTextField.delegate = self;
    self.locationTextField.delegate = self;
    
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

- (IBAction)addBtnClicked:(id)sender {
    
    NSString *title = self.titleTextField.text;
    NSString *location = self.locationTextField.text;
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if([title isEqualToString:@""]){
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"please input the title!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [alert show];
        
        return;
        
    }
    if([location isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"please input the location!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [alert show];
        
        return ;
    }
    
    if([self.endTimeBtn.titleLabel.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"You have to choose the End time!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [alert show];
        
        return ;
    }
    
    delegate.eventTitle = title;
    delegate.eventLocation = location;
}

- (IBAction)cancelBtnClicked:(id)sender {
    self.titleTextField.text = @"";
    self.locationTextField.text = @"";
    self.startTimeBtn.titleLabel.text = @"";
    self.endTimeBtn.titleLabel.text = @"";
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


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // done button was pressed - dismiss keyboard
    
    [textField resignFirstResponder];

        return YES;
}
- (IBAction)startTimeBtn:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TimeViewController *startTimeVC = [storyboard instantiateViewControllerWithIdentifier:@"TimeViewController"];
    [self presentViewController:startTimeVC animated:YES completion:nil];
}

- (IBAction)endTimeBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TimeViewController *endTimeVC = [storyboard instantiateViewControllerWithIdentifier:@"TimeViewController"];
    [self presentViewController:endTimeVC animated:YES completion:nil];
    
//    CGRect frame;
//    CGFloat height = self.view.frame.size.height - self.endTimeBtn.frame.origin.y;
//    frame = CGRectMake(0,self.endTimeBtn.frame.origin.y,self.view.frame.size.width, height);
//
//    //---------------------------------
//    
//    
//    UIViewController *viewController = [[UIViewController alloc]init];
//    UIView *viewForDatePicker = [[UIView alloc]initWithFrame:frame];
//    
//    self.datePicker = [[UIDatePicker alloc]initWithFrame:frame];
//    self.datePicker.datePickerMode = UIDatePickerModeDate;
//    self.datePicker.hidden = NO;
//    self.datePicker.date = [NSDate date];
//    [self.datePicker addTarget:self action:@selector(LabelChange:) forControlEvents:UIControlEventValueChanged];
//    
//    
//    
//    [viewForDatePicker addSubview:self.datePicker];
//    [viewController.view addSubview:viewForDatePicker];
//    
//    UIPopoverController *popOverForDatePicker = [[UIPopoverController alloc]initWithContentViewController:viewController];
//    
//    //popOverForDatePicker.delegate = self;
//    //[popOverForDatePicker setPopoverContentSize:CGSizeMake(frame.size.width, frame.size.height) animated:NO];
//    //[popOverForDatePicker presentPopoverFromRect:frame inView:self.view  permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown| UIPopoverArrowDirectionLeft|UIPopoverArrowDirectionRight) animated:YES];    
}

-(void) LabelChange{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm - dd:MMM:YYYY"];
    NSString *string;
    string = [df stringFromDate:self.datePicker.date];
    self.endTimeBtn.titleLabel.text = string;
    
}
@end
