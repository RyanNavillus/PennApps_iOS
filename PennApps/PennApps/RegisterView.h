//
//  RegisterView.h
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RegisterView : UIView
@property(nonatomic, copy) NSString *placeholder;
@property UITextField* name;
@property UITextField* specialty;
@property UITextField* userName;
@property UITextField* password;
@end
