//
//  ViewController.m
//  WaketheFup
//
//  Created by black on 4/9/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "ViewController.h"
#import "GenderChoiceViewController.h"
#import "AboutViewController.h"
#import "MealSnapViewController.h"
#import "ClientLoginViewController.h"
#import "AppDelegate.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.voiceBtn.layer.cornerRadius = 5;
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@" hh:mm a"];
    NSString *string;
    string = [df stringFromDate:[NSDate date]];
    self.inputTextField.text = string;
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

- (IBAction)voiceBtnClicked:(id)sender {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.inputString = self.inputTextField.text;
    delegate.speechText = self.inputString;
    NSLog(@"%@", delegate.speechText);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GenderChoiceViewController *genderVC = [storyboard instantiateViewControllerWithIdentifier:@"GenderChoiceViewController"];
    [self.navigationController pushViewController:genderVC animated:YES];
}

- (IBAction)helpBtnClicked:(id)sender {
      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AboutViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:aboutVC animated:YES];
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    return TRUE;
}        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

@end
