//
//  GenderChoiceViewController.h
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "RFSegmentView.h"


@interface GenderChoiceViewController : UIViewController<AVSpeechSynthesizerDelegate>

- (IBAction)mealSnapBtnClicked:(id)sender;
- (IBAction)clientLoginBtnClicked:(id)sender;
- (IBAction)reminderBtnClicked:(id)sender;
- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *aboutBtnClicked;
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;
@property (strong, nonatomic) IBOutlet UIButton *reminderBtn;

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) AVSpeechUtterance   *utterance;

@property (strong, nonatomic) IBOutlet UIView *genderChoice;









@end
