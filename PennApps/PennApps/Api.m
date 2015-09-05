//
//  Api.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "Api.h"




static NSString* kBaseURLString = @"http://45.79.138.244:80/";

static Api* kSharedApi;

@implementation Api




+ (instancetype)sharedApi
{
    if (!kSharedApi)
    {
        kSharedApi = [[Api alloc] init];
    }
    return kSharedApi;
}


-(void)loginWithUserName:(NSString *)username andPassword:(NSString *)password{
    // 1
    NSURL *dataUrl = [NSURL URLWithString:@"login"];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"username": username, @"password" : password};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                       NSLog(@"%@", myString);
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
    
}

-(void)registerWithUserName:(NSString *)username Password:(NSString *)password Specialty:(NSString *)specialty Name:(NSString *)name{
    // 1
    NSURL *dataUrl = [NSURL URLWithString:@"register"];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    // 3
    NSDictionary *dictionary = @{@"username": username, @"password" : password, @"specialty" : specialty, @"name" : name};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                       NSLog(@"%@", myString);
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
    
}

-(void)createNewMessage:(NSString *)message FromSenderType:(NSUInteger)senderType WithCID:(NSUInteger)cid{
    // 1
    NSURL *dataUrl = [NSURL URLWithString:@"/addmessage"];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"cid": [NSNumber numberWithInteger: cid], @"stype" : [NSNumber numberWithInteger:senderType], @"message" : message};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                       NSLog(@"%@", myString);
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
    
}

@end
