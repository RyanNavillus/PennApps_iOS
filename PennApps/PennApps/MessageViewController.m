//
//  MessageViewController.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/6/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "MessageViewController.h"
#import "messageView.h"
#import "Api.h"
@interface MessageViewController ()
@property NSString* cid;
@property UITextField* messageField;
@property messageView *mView;
@property NSMutableArray* messages;
@property Doctor* doctor;
@property UIButton* submitButton;
@end

@implementation MessageViewController

-(instancetype) initWithCID:(NSString *)cid andDoctor:(Doctor *)doctor{
    self = [super init];
    if(self){
        self.cid = cid;
        self.doctor = doctor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.mView;
    NSDictionary *json = [[Api sharedApi] getMessagesFrom:@"0" To:@"2" WithCID:self.cid];
    NSEnumerator *enumerator = [json keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        [self.messages addObject:[json objectForKey:key]];
    }
    
    [self createSubviews];
    
    
}
-(void)createSubviews{
    self.view = [[messageView alloc] init];
    self.view.backgroundColor = [UIColor orangeColor];
    self.messageField = [[UITextField alloc] init];
    self.messageField.textColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    
    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton addTarget:self action:@selector(submitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.submitButton.backgroundColor = [UIColor colorWithRed:234/255.0 green:230/255.0 blue:234/255.0 alpha:1.0];
    self.submitButton.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:61/255.0 blue:61/255.0 alpha:1.0]CGColor];
    self.submitButton.layer.cornerRadius = 5.0;
    self.submitButton.layer.borderWidth = 0.5;
    [self.submitButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.submitButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.f]];
    self.submitButton.layer.masksToBounds = NO;
    self.submitButton.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.submitButton.layer.shadowOpacity = 0.4;
    self.submitButton.layer.shadowRadius = 3.f;
    self.submitButton.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    [self.view addSubview:self.submitButton];
    [self createConstraints];
}
-(void)createConstraints{
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-24-[messageField]-24-|" options:0 metrics:nil views:@{@"messageField":self.messageField}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[message1]-[message2]-[message3]-[messageField(22)]-|" options:0 metrics:nil views:@{@"message1":[self.messages objectAtIndex:0],@"message2":[self.messages objectAtIndex:0],@"message3":[self.messages objectAtIndex:0],@"messageField":self.messageField}]];
    
}

-(void)submitButtonPressed{
    [[Api sharedApi] createNewMessage:self.messageField.text FromSenderType:@"doctor" WithCID:self.cid];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
