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
-(Doctor *)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
-(void)registerWithUsername:(NSString *)username Password:(NSString *)password Specialty:(NSString *)specialty Name:(NSString *)name;
-(void)createNewMessage:(NSString *)message FromSenderType:(NSString *)senderType WithCID:(NSString *)cid;
-(NSDictionary *)getQuestionListWithUsername:(NSString *)username WithAmount:(NSString *)amount andHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))handler;
-(void)getConversationListWithUsername:(NSString *)username andHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))handler;
-(NSDictionary *)getMessagesFrom:(NSString *)start To:(NSString *)end WithCID:(NSString *)cid;



@end
