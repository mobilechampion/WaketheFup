//
//  AppDelegate.h
//  WaketheFup
//
//  Created by black on 4/9/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TimeViewController.h"

@protocol customDelegate

- (void)displayDetail;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate,AVSpeechSynthesizerDelegate> 

@property (strong, nonatomic) UIWindow *window;
@property (strong ,nonatomic) id<customDelegate>delegate;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) AVSpeechUtterance   *utterance;

//------------ temp Event Info ---------------//

@property (strong, nonatomic) NSDate    *eventFireDate;

@property (strong, nonatomic) NSString  *eventTitle;
@property (strong, nonatomic) NSString  *eventLocation;
@property (strong, nonatomic) NSString  *eventStartTime;
@property (strong, nonatomic) NSString  *eventEndTime;
@property (strong, nonatomic) NSString  *speechText;
@property (strong, nonatomic) NSMutableArray *speechStore;

@property                     BOOL      isFemaleVoice;






@end

