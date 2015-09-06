//
//  ViewController.m
//  PennApps
//
//  Created by Ryan Sullivan on 9/5/15.
//  Copyright © 2015 Ryan Sullivan. All rights reserved.
//

#import "ViewController.h"
#import "loginView.h"
#import "RegisterView.h"
#import "ConversationViewController.h"
#import "PennApps-Swift.h"

@interface ViewController () <LGChatControllerDelegate>

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * tapLabel = [UILabel new];
    tapLabel.bounds = CGRectMake(0, 0, 200, 100);
    tapLabel.text = @"** TAP TO OPEN **";
    tapLabel.textAlignment = NSTextAlignmentCenter;
    tapLabel.center = self.view.center;
    tapLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:tapLabel];
    
    UITapGestureRecognizer * tap = [UITapGestureRecognizer new];
    [tap addTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)tap
{
    [self launchChatController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Styling

//- (void)styleChatInput
//{
//    [LGChatInput setAppearanceBackgroundColor:<#UIColor#>];
//    [LGChatInput setAppearanceIncludeBlur:<#Bool#>];
//    [LGChatInput setAppearanceTextViewFont:<#UIFont#>];
//    [LGChatInput setAppearanceTextViewTextColor:<#UIColor#>];
//    [LGChatInput setAppearanceTintColor:<#UIColor#>];
//    [LGChatInput setAppearanceTextViewBackgroundColor:<#UIColor#>];
//}

//- (void)styleMessageCell
//{
//    [LGChatMessageCell setAppearanceFont:<#UIFont#>];
//    [LGChatMessageCell setAppearanceOpponentColor:[<#UIColor#>];
//    [LGChatMessageCell setAppearanceUserColor:<#UIColor#>];
//}

#pragma mark - Launch Chat Controller

- (void)launchChatController
{
    LGChatController *chatController = [LGChatController new];
    chatController.opponentImage = [UIImage imageNamed:@"User"];
    chatController.title = @"Simple Chat";
    LGChatMessage *helloWorld = [[LGChatMessage alloc] initWithContent:@"Hello World!" sentByString:[LGChatMessage SentByUserString]];
    chatController.messages = @[helloWorld]; // Pass your messages here.
    chatController.delegate = self;
    [self.navigationController pushViewController:chatController animated:YES];
}

#pragma mark - LGChatControllerDelegate

- (void)chatController:(LGChatController *)chatController didAddNewMessage:(LGChatMessage *)message
{
    NSLog(@"Did Add Message: %@", message.content);
}

- (BOOL)shouldChatController:(LGChatController *)chatController addMessage:(LGChatMessage *)message
{
    /*
     This is implemented just for demonstration so the sent by is randomized.  This way, the full functionality can be demonstrated.
     */
    message.sentByString = arc4random_uniform(2) == 0 ? [LGChatMessage SentByOpponentString] : [LGChatMessage SentByUserString];
    return YES;
}

@end


//@implementation ViewController
//#pragma mark - Launch Chat Controller
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    UILabel * tapLabel = [UILabel new];
//    tapLabel.bounds = CGRectMake(0, 0, 200, 100);
//    tapLabel.text = @"** TAP TO OPEN **";
//    tapLabel.textAlignment = NSTextAlignmentCenter;
//    tapLabel.center = self.view.center;
//    tapLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
//    [self.view addSubview:tapLabel];
//    
//    UITapGestureRecognizer * tap = [UITapGestureRecognizer new];
//    [tap addTarget:self action:@selector(handleTap:)];
//    [self.view addGestureRecognizer:tap];
//}
//
//- (void)handleTap:(UITapGestureRecognizer *)tap
//{
//    [self launchChatController];
//}
//
//
//
//
//
//- (void)launchChatController
//{
//    LGChatController *chatController = [LGChatController new];
//    chatController.opponentImage = [UIImage imageNamed:@"<#YourImageName#>"];
//    chatController.title = @"<#YourTitle#>";
//    LGChatMessage *helloWorld = [[LGChatMessage alloc] initWithContent:@"Hello World" sentByString:[LGChatMessage SentByUserString]];
//    chatController.messages = @[helloWorld]; // Pass your messages here.
//    chatController.delegate = self;
//    [self.navigationController pushViewController:chatController animated:YES];
//}
//
//#pragma mark - LGChatControllerDelegate
//
//- (void)chatController:(LGChatController *)chatController didAddNewMessage:(LGChatMessage *)message
//{
//    NSLog(@"Did Add Message: %@", message.content);
//}
//
//
//- (BOOL)shouldChatController:(LGChatController *)chatController addMessage:(LGChatMessage *)message
//{
//    /*
//     Use this space to prevent sending a message, or to alter a message.  For example, you might want to hold a message until its successfully uploaded to a server.
//     */
//    return YES;
//}
//- (void)styleChatInput
//{
//    UIColor* const COLOR_LIGHT_BLUE = [[UIColor alloc] initWithRed:21.0f/255 green:180.0f/255  blue:1 alpha:1];
//    [LGChatInput setAppearanceBackgroundColor: COLOR_LIGHT_BLUE];
//    [LGChatInput setAppearanceIncludeBlur:YES];
//    [LGChatInput setAppearanceTextViewFont:[UIFont fontWithName:@"Helvetica" size:18.f]];
//    [LGChatInput setAppearanceTextViewTextColor:COLOR_LIGHT_BLUE];
//    [LGChatInput setAppearanceTintColor:COLOR_LIGHT_BLUE];
//    [LGChatInput setAppearanceTextViewBackgroundColor:COLOR_LIGHT_BLUE];
//}
//
//
//
//@end
