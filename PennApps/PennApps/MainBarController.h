//
//  MainBarController.h
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface MainBarController : UITabBarController
-(instancetype)initWithDoctor:(Doctor *)doctor;
@end
