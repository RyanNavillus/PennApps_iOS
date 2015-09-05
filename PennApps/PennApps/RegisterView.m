//
//  RegisterView.m
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterView.h"
#import "Api.h"
@interface RegisterView()
@property UILabel* registrationLabel;
@property UITextField* name;
@property UITextField* Specialty;
@property UITextField* userName;
@property UITextField* password;
@property UIButton* submitButton;
@end

@implementation RegisterView


-(instancetype)init{
    self = [super init];
    if(self){
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews{
    self.backgroundColor = [UIColor orangeColor];
    self.registrationLabel = [[UILabel alloc] init];
    self.registrationLabel.backgroundColor = [UIColor redColor];
    self.registrationLabel.numberOfLines = 0;
    self.registrationLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.registrationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.registrationLabel];
    
    
    self.name = [[UITextField alloc] init];
    self.name.backgroundColor = [UIColor greenColor];
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.name];
    
    self.Specialty = [[UITextField alloc] init];
    self.Specialty.backgroundColor = [UIColor blueColor];
    self.Specialty.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.Specialty];

    self.userName = [[UITextField alloc] init];
    self.userName.backgroundColor = [UIColor blueColor];
    self.userName.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.userName];
    
    self.password = [[UITextField alloc] init];
    self.password.backgroundColor = [UIColor blueColor];
    self.password.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.password];

    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton addTarget:self action:@selector(submitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
    
    [self createConstraints];
}

-(void)createConstraints{
    
    //Horizontal
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registrationLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.name attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.Specialty attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.userName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.password attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[registrationLabel]-28-|" options:0 metrics:nil views:@{@"registrationLabel" : self.registrationLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[name]-28-|" options:0 metrics:nil views:@{@"name" : self.name}]];
       [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[Specialty]-28-|" options:0 metrics:nil views:@{@"Specialty" : self.Specialty}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[userName]-28-|" options:0 metrics:nil views:@{@"userName" : self.userName}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[password]-28-|" options:0 metrics:nil views:@{@"password" : self.password}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-28-[submitButton]-28-|" options:0 metrics:nil views:@{@"submitButton" : self.submitButton}]];
    
    
    
    //Vertical
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=50)-[registrationLabel(22)]-[name]-10-[Specialty]-[userName]-[password]-[submitButton]-(>=50)-|" options:0 metrics:nil views:@{@"registrationLabel" : self.registrationLabel, @"name" : self.name, @"Specialty" : self.Specialty, @"userName" : self.userName, @"password" : self.password, @"submitButton" : self.submitButton}]];
    
}

-(void)submitButtonPressed{
    NSLog(@"Hi");
    NSString *fName = [[NSString alloc] init];
    fName = self.name.text;
    NSString *specialty = [[NSString alloc] init];
    specialty = self.Specialty.text;
    NSString *uName = [[NSString alloc] init];
    uName = self.userName.text;
    NSString *passwd = [[NSString alloc] init];
    passwd = self.password.text;
    
    
    //API STUFF

    [[Api sharedApi] registerWithUserName:uName Password:passwd Specialty:specialty Name:fName];
}
@end
