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
#import "RegisterViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface RegisterView()
@property UIImageView* logoView;
@property UILabel* registrationLabel;
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
    self.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    
    self.logoView = [[UIImageView alloc] init];
    self.logoView.image = [UIImage imageNamed:@"logo"];
    self.logoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.logoView];
    
    self.registrationLabel = [[UILabel alloc] init];
    self.registrationLabel.numberOfLines = 0;
    self.registrationLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.registrationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.registrationLabel.text = @"Register Here";
    self.registrationLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.registrationLabel.font = [UIFont fontWithName:@"Helvetica" size:18.f];
    self.registrationLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.registrationLabel];
    
    self.name = [[UITextField alloc] init];
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    self.name.placeholder = @"Name";
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.name.layer.cornerRadius = 5.0;
    self.name.layer.borderWidth = 0.5;
    self.name.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.name.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.name];

    self.name.tag = 1;
    
    self.specialty = [[UITextField alloc] init];
    self.specialty.translatesAutoresizingMaskIntoConstraints = NO;
    self.specialty.placeholder = @"Medical Profession";
    self.specialty.textAlignment = NSTextAlignmentCenter;
    self.specialty.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.specialty.layer.cornerRadius = 5.0;
    self.specialty.layer.borderWidth = 0.5;
    self.specialty.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.specialty.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.specialty];

    self.userName = [[UITextField alloc] init];
    self.userName.translatesAutoresizingMaskIntoConstraints = NO;
    self.userName.placeholder = @"User Name";
    self.userName.textAlignment = NSTextAlignmentCenter;
    self.userName.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.userName.layer.cornerRadius = 5.0;
    self.userName.layer.borderWidth = 0.5;
    self.userName.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.userName.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.userName];
    self.userName.tag = 3;
    [self addSubview:self.userName];
    
    self.password = [[UITextField alloc] init];
    self.password.translatesAutoresizingMaskIntoConstraints = NO;
    self.password.secureTextEntry = YES;
    self.password.placeholder = @"Password";
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.password.layer.cornerRadius = 5.0;
    self.password.layer.borderWidth = 0.5;
    self.password.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.password.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    [self addSubview:self.password];

    [self createConstraints];
}

-(void)createConstraints{
    
    //Horizontal
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.logoView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registrationLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.name attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.specialty attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.userName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.password attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[name]-48-|" options:0 metrics:nil views:@{@"name" : self.name}]];
       [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[specialty]-48-|" options:0 metrics:nil views:@{@"specialty" : self.specialty}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[userName]-48-|" options:0 metrics:nil views:@{@"userName" : self.userName}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-48-[password]-48-|" options:0 metrics:nil views:@{@"password" : self.password}]];
    
    //Vertical
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[logoView(96)]-16-[registrationLabel(20)]-16-[name(20)]-16-[specialty(20)]-16-[userName(20)]-16-[password(20)]-(>=50)-|" options:0 metrics:nil views:@{@"logoView" : self.logoView, @"registrationLabel" : self.registrationLabel, @"name" : self.name, @"specialty" : self.specialty, @"userName" : self.userName, @"password" : self.password}]];
    
}


@end
