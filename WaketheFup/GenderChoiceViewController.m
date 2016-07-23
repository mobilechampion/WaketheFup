//
//  GenderChoiceViewController.m
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "GenderChoiceViewController.h"
#import "TimeChoiceViewController.h"
#import "AboutViewController.h"
#import "MealSnapViewController.h"
#import "ClientLoginViewController.h"
#import "AppDelegate.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface GenderChoiceViewController ()<RFSegmentViewDelegate>

@end

@implementation GenderChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mealSnapBtn.layer.cornerRadius = 5;
    self.clientLoginBtn.layer.cornerRadius = 5;
    self.reminderBtn.layer.cornerRadius = 5;
    
    //---------- Init of converting text to speech ----default is male's voice--//
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    delegate.isFemaleVoice = FALSE;
    NSString *alarmText = [[NSString alloc] init];
    alarmText = delegate.speechText;
    [self textToSpeech:alarmText with:delegate];
    
    // --------------- init the segement of Gender choice -----------------//
    RFSegmentView* segmentView = [[RFSegmentView alloc] initWithFrame:self.genderChoice.frame items:@[@"male",@"female"]];
    segmentView.tintColor = [UIColor colorWithRed:(241.0/255.0) green:(94.0/255.0) blue:(34/255.0) alpha:1];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
}

//---------------- Init of converting text to speech ---------------//
- (void)textToSpeech:(NSString*)text with:(AppDelegate *)delegate{
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    self.utterance = [[AVSpeechUtterance alloc] initWithString:text];
    if (delegate.isFemaleVoice) {
        self.utterance.pitchMultiplier = 1.5;
    }
    else {
        self.utterance.pitchMultiplier = 0.5;
    }
    self.utterance.rate = 0.1;
    [self.synthesizer speakUtterance:self.utterance];
    [delegate.speechStore addObject:self.utterance];
    NSLog(@"speech %@", self.synthesizer);
//    self.utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want /Users/gold/Downloads/icon1024x1024.pngto do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)mealSnapBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MealSnapViewController *mealSnapVC = [storyboard instantiateViewControllerWithIdentifier:@"MealSnapViewController"];
    [self.navigationController pushViewController:mealSnapVC animated:YES];
}

- (IBAction)reminderBtnClicked:(id)sender {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSLog(@"/.....saved info...../%@, %d", delegate.speechText, delegate.isFemaleVoice );
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TimeChoiceViewController *timeChoiceVC = [storyboard instantiateViewControllerWithIdentifier:@"TimeChoiceViewController"];
    [self.navigationController pushViewController:timeChoiceVC animated:YES];
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

- (void)segmentViewSelectIndex:(NSInteger)index
{
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    delegate.isFemaleVoice = (index == 1) ? TRUE : FALSE;
    [self textToSpeech:delegate.speechText with:delegate];
}

@end
