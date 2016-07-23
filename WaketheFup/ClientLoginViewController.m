//
//  ClientLoginViewController.m
//  WaketheFup
//
//  Created by black on 4/14/15.
//  Copyright (c) 2015 black. All rights reserved.
//

#import "ClientLoginViewController.h"
#import "AboutViewController.h"

@interface ClientLoginViewController ()

@end

@implementation ClientLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)submitBtnClicked:(id)sender {
}
@end
