//
//  ViewController.h
//  WaketheFup
//
//  Created by black on 4/9/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityVC.h"
#import "MVSpeechSynthesizer.h"


@interface ViewController : UIViewController <UINavigationControllerDelegate,UIActionSheetDelegate, UIGestureRecognizerDelegate , UIImagePickerControllerDelegate,UITextFieldDelegate>

- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;
- (IBAction)voiceBtnClicked:(id)sender;
- (IBAction)helpBtnClicked:(id)sender;
//- (void) convertTextToVoice:(NSString *) text;

@property (strong, nonatomic) NSString * inputString;
@property (strong, nonatomic) IBOutlet UITextField *inputTextField;

@property (strong, nonatomic) IBOutlet UIButton *voiceBtn;
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;



@end

