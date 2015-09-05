//
//  DataManager.m
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager


+ (instancetype) sharedInstance {
    
    static DataManager *sharedDataManager = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [[self alloc] init];
    });

    return sharedDataManager;
}


- (void) addcID: (NSString*) addedID{
    NSMutableArray* mutablecIDArray = [self.cIDs mutableCopy];
    [mutablecIDArray addObject:addedID];
    [self setCIDs:mutablecIDArray];
    
    
}


- (void)save{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.cIDs forKey: @"ID Array"];
    [userDefaults synchronize];
}



- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        NSArray* cIDs = [userDefaults objectForKey: @"ID Array"];
        [self setCIDs:cIDs];
        
    }
    return self;
}


@end
