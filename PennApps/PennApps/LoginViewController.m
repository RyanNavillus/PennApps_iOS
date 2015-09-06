//
//  LoginViewController.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "LoginViewController.h"
#import "loginView.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property UIButton* registerButton;
@end
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[loginView alloc] init];
    self.registerButton = [[UIButton alloc] init];
    [self.registerButton setTitleColor:[UIColor colorWithRed:0 green:0.478431 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [self.registerButton setTitle:@"Register New User" forState:UIControlStateNormal];
    [self.registerButton.titleLabel setFont:[UIFont systemFontOfSize:11.f]];
    [self.registerButton addTarget:self action:@selector(registerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.registerButton];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:120.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-210.f]];
    NSLog(@"%@", self.view.subviews);
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerButtonPressed{
    RegisterViewController *rv = [[RegisterViewController alloc] init];
    [self presentViewController:rv animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
