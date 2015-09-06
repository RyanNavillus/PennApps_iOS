//
//  InboxView.h
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ConversationViewController.h"
#import "PennApps-Swift.h"

@interface ConversationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, LGChatControllerDelegate>
-(instancetype)initWithUsername:(NSString *)username;

@end