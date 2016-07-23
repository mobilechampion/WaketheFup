//
//  MealSnapViewController.h
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealSnapViewController : UIViewController<UIActionSheetDelegate, UIGestureRecognizerDelegate , UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *mealSnapBtn;
@property (strong, nonatomic) IBOutlet UIButton *clientLoginBtn;
@property (strong, nonatomic) IBOutlet UIImageView *mealSnapImage;

- (IBAction)backBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;
- (IBAction)takePhotoTapped:(id)sender;

@end
