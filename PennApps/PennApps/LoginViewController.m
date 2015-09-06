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
#import "MainBarController.h"
#import "QuestionViewController.h"
#import "ConversationViewController.h"
#import "Doctor.h"
#import "Api.h"
@interface LoginViewController ()
@property UIButton* registerButton;
@property UIButton* submitButton;
@property Doctor* doctor;

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
    
    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton addTarget:self action:@selector(submitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.submitButton.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    self.submitButton.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.submitButton.layer.cornerRadius = 5.0;
    self.submitButton.layer.borderWidth = 0.5;
    [self.submitButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.submitButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.f]];
    self.submitButton.layer.masksToBounds = NO;
    self.submitButton.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.submitButton.layer.shadowOpacity = 0.4;
    self.submitButton.layer.shadowRadius = 3.f;
    self.submitButton.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    [self.view addSubview:self.submitButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.f]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[submitButton]-48-|" options:0 metrics:nil views:@{@"submitButton" : self.submitButton}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-260.f]];
    
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

-(void)submitButtonPressed{
    
    NSString *userName = [[NSString alloc] init];
    userName = ((loginView *)self.view).userNameField.text;
    NSString *password = [[NSString alloc] init];
    password = ((loginView *)self.view).passwordField.text;

    self.doctor = [[Api sharedApi] loginWithUsername:userName andPassword:password];

    MainBarController *bc = [[MainBarController alloc] init];
    ConversationViewController *cc = [[ConversationViewController alloc] initWithUsername:@"aep000"];
    [bc addChildViewController:cc];
    QuestionViewController *qc = [[QuestionViewController alloc] initWithUsername:@"aep000"];
    [bc addChildViewController:qc];
    [self presentViewController:bc animated:YES completion:nil];
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
