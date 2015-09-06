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
#import "MessageViewController.h"
@interface ConversationViewController()
-(void)viewDidLoad;
@property NSMutableArray *conversations;
@property NSString* username;
@property UITableView* tableView;
@property NSString* cid;
@property Doctor* doctor;
@end

@implementation ConversationViewController {
        UITableView *tableView;
}

-(instancetype)initWithDoctor:(Doctor *)doctor{
    self = [super init];
    if(self){
        self.doctor = doctor;
        __block NSDictionary *json;
       [[Api sharedApi] getConversationListWithUsername:self.doctor.name andHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(data){
                json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                NSLog(@"%@", json);
                //dictionary of dictionaries
                self.conversations = [[NSMutableArray alloc] init];
                NSEnumerator *enumerator = [json keyEnumerator];
                id key;
                while ((key = [enumerator nextObject])) {
                    [self.conversations addObject:[json objectForKey:key]];
                }
                [self.tableView reloadData];
            }

        }];
    }
    return self;
}
- (void)viewDidLoad{
    
    [super viewDidLoad];
    // init table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //or, you may do that
    //tableView = [[UITableView alloc] init];
    //tableView.frame = CGRectMake:(5 , 5 , 320 , 300);
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
;
    self.tableView.allowsSelection = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    // add to canvas
    [self.view addSubview:self.tableView];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewPress:)];
    [self.tableView  addGestureRecognizer:tapGesture];
    tapGesture.cancelsTouchesInView = YES;
    tapGesture.delegate = self;
    [self.tableView reloadData];
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.f;
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
    self.cid = [((NSDictionary *)[self.conversations objectAtIndex:[TableCustomCell getInstances]]) objectForKey:@"cid"];
    cell.descriptionLabel.text = [((NSDictionary *)[self.conversations objectAtIndex:[TableCustomCell getInstances]]) objectForKey:@"question"];

    cell.nameLabel.text = [((NSDictionary *)[self.conversations objectAtIndex:[TableCustomCell getInstances]]) objectForKey:@"sendername"];
    [TableCustomCell addInstance];
    return cell;
}

-(void)createConstraints{
    //Horizontal
    [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:@{@"tableView" : self.tableView}]];
    
    //Vertical
    [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:@{@"tableView" : self.tableView}]];
}

- (void) tableViewPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    if (indexPath == nil)
        NSLog(@"long press on table view but not on a row");
    else {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    }
    [self presentViewController:[[MessageViewController alloc] initWithCID:self.cid andDoctor:self.doctor] animated:YES completion:nil];
}


@end

