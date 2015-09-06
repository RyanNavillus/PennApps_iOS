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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnToLogin{
    
    
}

-(void)submitButtonPressed{

    
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
