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


-(void)getHelloWorld{
    // 1
    NSString *dataUrl = @"";
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    // 2
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", myString);
    }];
    
    [downloadTask resume];
    
}

-(Doctor *)loginWithUserName:(NSString *)username andPassword:(NSString *)password{
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
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    Doctor *doctor = [[Doctor alloc] init];
    
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            if(data){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                [doctor setProperties:json];
            }
        }];
        
        // 5
        [dataTask resume];
    }
    return doctor;
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
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];

    
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            if(data){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&error];
            }
        }];
        
        // 5
        [dataTask resume];
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
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    
    
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&error];
        }];
        
        // 5
        [dataTask resume];
    }
    
}

-(void)getConversationList{
    // 1
    NSString *dataUrl = @"conversations";
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    // 2
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(data){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&error];
            //store value for "cid" key in Core Data
        }
    }];
    
    [downloadTask resume];
    
}

@end
