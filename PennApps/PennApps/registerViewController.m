//
//  RegisterViewController.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "Api.h"
#import "LoginViewController.h"
@interface RegisterViewController ()
@property UIButton* submitButton;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[RegisterView alloc] init];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:120.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-210.f]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnToLogin{
    
    
}

-(void)submitButtonPressed{
    NSString *fName = [[NSString alloc] init];
    fName = ((RegisterView *)self.view).name.text;
    NSString *specialty = [[NSString alloc] init];
    specialty = ((RegisterView *)self.view).specialty.text;
    NSString *uName = [[NSString alloc] init];
    uName = ((RegisterView *)self.view).userName.text;
    NSString *passwd = [[NSString alloc] init];
    passwd = ((RegisterView *)self.view).password.text;
    
    
    //API STUFF
    
    [[Api sharedApi] registerWithUserName:uName Password:passwd Specialty:specialty Name:fName];
    LoginViewController *vc = [[LoginViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];

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
