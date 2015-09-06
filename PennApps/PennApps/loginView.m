//
//  loginView.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "loginView.h"
#import "Api.h"
#import "Doctor.h"
#import "RegisterView.h"
#import "LoginViewController.h"
@interface loginView()
@property UIImageView* logoView;
@property UILabel* loginLabel;


@property Doctor* doctor;

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
    self.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];

    self.logoView = [[UIImageView alloc] init];
    self.logoView.image = [UIImage imageNamed:@"logo"];
    self.logoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.logoView];
    
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.numberOfLines = 0;
    self.loginLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.loginLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginLabel.text = @"Login";
    self.loginLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.loginLabel.font = [UIFont fontWithName:@"Helvetica" size:18.f];
    self.loginLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.loginLabel];
    
    self.userNameField = [[UITextField alloc] init];
    self.userNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.userNameField.placeholder = @"User Name";
    self.userNameField.textAlignment = NSTextAlignmentCenter;
    self.userNameField.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.userNameField.layer.cornerRadius = 5.0;
    self.userNameField.layer.borderWidth = 0.5;
    self.userNameField.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.userNameField.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.userNameField];
    
    self.passwordField = [[UITextField alloc] init];
    self.passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordField.secureTextEntry = YES;
    self.passwordField.placeholder = @"Password";
    self.passwordField.textAlignment = NSTextAlignmentCenter;
    self.passwordField.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.passwordField.layer.cornerRadius = 5.0;
    self.passwordField.layer.borderWidth = 0.5;
    self.passwordField.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.passwordField.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.passwordField];
    
    
    
    

    [self createConstraints];
}

-(void)createConstraints{
    
    //Horizontal
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.logoView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.userNameField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[loginLabel]-48-|" options:0 metrics:nil views:@{@"loginLabel" : self.loginLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[userNameField]-48-|" options:0 metrics:nil views:@{@"userNameField" : self.userNameField}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[passwordField]-48-|" options:0 metrics:nil views:@{@"passwordField" : self.passwordField}]];
    
    
    //Vertical
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[logoView(96)]-16-[loginLabel(20)]-16-[userNameField(20)]-16-[passwordField(20)]-(>=60)-|" options:0 metrics:nil views:@{@"logoView" : self.logoView, @"loginLabel" : self.loginLabel, @"userNameField" : self.userNameField, @"passwordField" : self.passwordField}]];
    
}

-(void)submitButtonPressed{
    NSLog(@"Hi");

}

@end
