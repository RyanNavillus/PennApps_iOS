//
//  InboxView.m
//  PennApps
//
//  Created by Darpan Shah on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ConversationViewController.h"
#import "TableCustomCell.h"
#import "Api.h"
@interface ConversationViewController()
-(void)viewDidLoad;
@property NSMutableArray *conversations;
@property NSString* username;
@end

@implementation ConversationViewController {
        UITableView *tableView;
}

-(instancetype)initWithUsername:(NSString *)username{
    self = [super init];
    if(self){
        self.username = username;
    }
    return self;
}
- (void)viewDidLoad{
    
    [super viewDidLoad];
    // init table view
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //or, you may do that
    //tableView = [[UITableView alloc] init];
    //tableView.frame = CGRectMake:(5 , 5 , 320 , 300);
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    [self.view addSubview:tableView];
    
    NSDictionary *cvs = [[Api sharedApi] getConversationListWithUsername:self.username];
    
    NSEnumerator *enumerator = [cvs keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        [self.conversations addObject:[cvs objectForKey:key]];
    }
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [self.conversations count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    
    // Similar to UITableViewCell, but
    TableCustomCell *cell = (TableCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TableCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.descriptionLabel.text = [self.conversations objectAtIndex:[TableCustomCell getInstances]];
    [TableCustomCell addInstance];
    return cell;
}

@end

