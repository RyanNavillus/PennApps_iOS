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
                NSLog(@"%@",json);
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

-(void)createNewMessage:(NSString *)message FromSenderType:(NSString *)senderType WithCID:(NSString *)cid{
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
    NSDictionary *dictionary = @{@"cid": cid, @"stype" : senderType, @"message" : message};
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

- (NSString *)stringFromHexString:(NSString *)hexString {
    
    // The hex codes should all be two characters.
    if (([hexString length] % 2) != 0)
        return nil;
    
    NSMutableString *string = [NSMutableString string];
    
    for (NSInteger i = 0; i < [hexString length]; i += 2) {
        
        NSString *hex = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSInteger decimalValue = 0;
        sscanf([hex UTF8String], "%lx", &decimalValue);
        [string appendFormat:@"%ld", (long)decimalValue];
    }
    
    return string;
}

@end
