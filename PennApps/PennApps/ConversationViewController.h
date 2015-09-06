//
//  InboxView.h
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ConversationViewController.h"
@interface ConversationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
-(instancetype)initWithUsername:(NSString *)username;

@end