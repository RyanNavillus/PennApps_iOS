//
//  Api.h
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"


@interface Api : NSObject
+ (instancetype)sharedApi;
-(Doctor *)loginWithUserName:(NSString *)username andPassword:(NSString *)password;
-(void)registerWithUserName:(NSString *)username Password:(NSString *)password Specialty:(NSString *)specialty Name:(NSString *)name;
-(void)createNewMessage:(NSString *)message FromSenderType:(NSString *)senderType WithCID:(NSString *)cid;
-(NSDictionary *)getConversationList;


@end
