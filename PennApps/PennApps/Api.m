//
//  Api.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "Api.h"



static NSString* kBaseURLString = @"http://45.79.138.244:5000/";

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


-(Doctor *)loginWithUsername:(NSString *)username andPassword:(NSString *)password{
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
                NSLog(@"%@",json);
                [doctor setProperties:json];
            }
        }];
        
        // 5
        [dataTask resume];
    }
    return doctor;
}

-(void)registerWithUsername:(NSString *)username Password:(NSString *)password Specialty:(NSString *)specialty Name:(NSString *)name{
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
                NSLog(@"%@",json);
            }
        }];
        
        // 5
        [dataTask resume];
    }
    
}

-(void)createNewMessage:(NSString *)message FromSenderType:(NSString *)senderType WithCID:(NSString *)cid FromUsername:(NSString *)username{
    // 1
    NSURL *dataUrl = [NSURL URLWithString:@"addmessage"];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"cid": cid, @"stype" : senderType, @"message" : message, @"uname": username};
    NSError *error = nil;
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    
    
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            if(data){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&error];
            
            NSLog(@"%@",json);
            }
        }];
        
        // 5
        [dataTask resume];
    }
    
}

-(NSDictionary *)getMessagesFrom:(NSString *)start To:(NSString *)end WithCID:(NSString *)cid{
    // 1
    NSString *dataUrl = @"getmessage";
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];

    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"start":start, @"end":end, @"cid":cid};
    NSError *error = nil;
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    
    __block NSDictionary *json;
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            if(data){
                json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                NSLog(@"%@", json);
                
            }
        }];
        
        // 5
        [dataTask resume];
    }
    return json;
}

-(NSDictionary *)getQuestionListWithUsername:(NSString *)username WithAmount:(NSString *)amount andHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))handler{
    // 1
    NSString *dataUrl = @"doclist";
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"uname":username, @"amount" : amount};
    NSError *error = nil;
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    
    __block NSDictionary *json;
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:handler];
        
        // 5
        [dataTask resume];
    }
    return json;
    
}
-(void)getConversationListWithUsername:(NSString *)username andHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))handler{
    // 1
    NSLog(@"Getting Conversation List");
    NSString *dataUrl = @"getconvo";
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kBaseURLString, dataUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"uname":username};
    NSError *error = nil;
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error]];
    
    if (!error) {
        // 4
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:handler];
        
        // 5
        [dataTask resume];
    }
}

@end
