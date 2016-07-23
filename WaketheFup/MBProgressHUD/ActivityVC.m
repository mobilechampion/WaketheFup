//
//  ActivityVC.m
//  GPP
//
//  Created by Jesper on 12/18/14.
//  Copyright (c) 2014 KCC. All rights reserved.
//

#import "ActivityVC.h"


@implementation ActivityVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;

}

- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark -
#pragma mark - MBPRogressHUD Delegate


- (void) showHUD :(NSString*)text
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = nil;
    
    HUD.labelText = text;
    
    [HUD show:YES];
    
}

- (void) hideHUD
{
    [HUD hide:YES];
}


@end
