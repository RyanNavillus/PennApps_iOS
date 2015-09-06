//
//  TableCustomCell.h
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import<UIKit/UIKit.h>

@interface TableCustomCell : UITableViewCell

// now only showing one label, you can add more yourself
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *nameLabel;
+(void)addInstance;
+(void)removeInstance;
+(NSUInteger)getInstances;
@end