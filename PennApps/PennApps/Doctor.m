//
//  Doctor.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "Doctor.h"
@interface Doctor()

@end
@implementation Doctor
-(instancetype)initWithProperties:(NSDictionary *)properties{
    self = [super init];
    if(self){
        self.name = [properties objectForKey:@"name"];
        self.specialty = [properties objectForKey:@"specialty"];
    }
    return self;
}

-(void)setProperties:(NSDictionary *)properties{
    self.name = [properties objectForKey:@"name"];
    self.specialty = [properties objectForKey:@"specialty"];
}
@end
