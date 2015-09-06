//
//  TableViewCell.m
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "TableCustomCell.h"
#import <Foundation/Foundation.h>
static NSUInteger instances;

@implementation TableCustomCell

@synthesize descriptionLabel = _descriptionLabel;
@synthesize nameLabel = _nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:16.0f];
        
        [self addSubview:self.descriptionLabel];
    }
    return self;
}

+(void)addInstance{
    instances++;
}
+(void)removeInstance{
    instances--;
}
+(NSUInteger)getInstances{
    return instances;
}
@end