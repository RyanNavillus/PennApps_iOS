//
//  MessageViewController.h
//  PennApps
//
//  Created by Ryan Sullivan on 9/6/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface MessageViewController : UIViewController
-(instancetype) initWithCID:(NSString *)cid andDoctor:(Doctor *)doctor;
@end
