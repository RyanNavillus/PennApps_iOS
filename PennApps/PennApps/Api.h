//
//  Api.h
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Api : NSObject
+ (instancetype)sharedApi;
-(void)getHelloWorld;
@end
