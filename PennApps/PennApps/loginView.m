//
//  loginView.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "loginView.h"
#import "Api.h"
@interface loginView()
@property UILabel* loginLabel;
@property UITextField* userNameField;
@property UITextField* passwordField;
@property UIButton* submitButton;
@end

@implementation loginView


-(instancetype)init{
    self = [super init];
    if(self){
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews{
    self.backgroundColor = [UIColor orangeColor];
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.backgroundColor = [UIColor redColor];
    self.loginLabel.numberOfLines = 0;
    self.loginLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.loginLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.loginLabel];
    
    
    self.userNameField = [[UITextField alloc] init];
    self.userNameField.backgroundColor = [UIColor greenColor];
    self.userNameField.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.userNameField];
    
    self.passwordField = [[UITextField alloc] init];
    self.passwordField.backgroundColor = [UIColor blueColor];
    self.passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordField.secureTextEntry = YES;
    [self addSubview:self.passwordField];
    
    
    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton addTarget:self action:@selector(submitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
    
    [self createConstraints];
}

-(void)createConstraints{
    
    //Horizontal
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.userNameField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[loginLabel]-28-|" options:0 metrics:nil views:@{@"loginLabel" : self.loginLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[userNameField]-28-|" options:0 metrics:nil views:@{@"userNameField" : self.userNameField}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[passwordField]-28-|" options:0 metrics:nil views:@{@"passwordField" : self.passwordField}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[submitButton]-28-|" options:0 metrics:nil views:@{@"submitButton" : self.submitButton}]];

    
    
    //Vertical
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=50)-[loginLabel(22)]-[userNameField]-10-[passwordField]-[submitButton]-(>=50)-|" options:0 metrics:nil views:@{@"loginLabel" : self.loginLabel, @"userNameField" : self.userNameField, @"passwordField" : self.passwordField, @"submitButton" : self.submitButton}]];
    
}

-(void)submitButtonPressed{
    NSLog(@"Hi");
    NSString *userName = [[NSString alloc] init];
    userName = self.userNameField.text;
    NSString *password = [[NSString alloc] init];
    password = self.passwordField.text;
    
    
    //API STUFF
    [[Api sharedApi] getHelloWorld];
    
}
@end
