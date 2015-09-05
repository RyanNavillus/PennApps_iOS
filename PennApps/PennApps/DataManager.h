//
//  DataManager.h
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype) sharedInstance;


@property NSArray* cIDs;

- (void) addcID: (NSString*) addedID;
-(void) save;

@end
