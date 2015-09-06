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
        [self createSubviews];
        }
    return self;
}

-(void)createSubviews{
    self.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
    self.descriptionLabel.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    self.descriptionLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    self.descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
    self.descriptionLabel.numberOfLines = 2;
    self.descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.descriptionLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
    self.nameLabel.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    self.nameLabel.textColor = [UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0];
    self.nameLabel.font = [UIFont fontWithName:@"Helvetica" size:16.0f];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.nameLabel];
    [self createConstraints];
}

-(void)createConstraints{
    //Horizontal
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[descriptionLabel]-16-|" options:0 metrics:nil views:@{@"descriptionLabel":self.descriptionLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[nameLabel]-16-|" options:0 metrics:nil views:@{@"nameLabel":self.nameLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[nameLabel(>=100)]-16-[descriptionLabel]-|" options:0 metrics:nil views:@{@"descriptionLabel":self.descriptionLabel, @"nameLabel":self.nameLabel}]];
        //Vertical
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