//
//  ActivityVC.h
//  GPP
//
//  Created by Jesper on 12/18/14.
//  Copyright (c) 2014 KCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@class AppDelegate;
@interface ActivityVC : UIViewController
{
    MBProgressHUD       *HUD;
    
}


- (void) showHUD :(NSString*)text;
- (void) hideHUD;

@end
