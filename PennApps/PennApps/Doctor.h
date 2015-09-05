//
//  Doctor.h
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject
-(instancetype)initWithProperties:(NSDictionary *)properties;
-(void)setProperties:(NSDictionary *)properties;
@property NSString* name;
@property NSString* specialty;
@end
