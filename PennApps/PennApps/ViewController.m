//
//  ViewController.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "ViewController.h"
#import "loginView.h"
#import "RegisterView.h"
#import "InboxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.view = [[RegisterView alloc] init];
}


@end
