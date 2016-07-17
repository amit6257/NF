//
//  AppDelegate.m
//  Thoughts
//
//  Created by AMIT AGARWAL on 7/13/16.
//  Copyright © 2016 AMIT AGARWAL. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SeeNFDetailsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//If your app is not running in the foreground, to handle the default action when a user just swipes or taps
//on a notification, iOS launches your app in the foreground and calls the UIApplicationDelegate method
//application:didFinishLaunchingWithOptions: passing in the local notification or the remote notification in
//the options dictionary.
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    UIUserNotificationType types = (UIUserNotificationType) (UIUserNotificationTypeBadge |
                                                             UIUserNotificationTypeSound | UIUserNotificationTypeAlert);
    ViewController* vc = [[ViewController alloc]init];
    self.window.rootViewController = vc;
    
    UIUserNotificationSettings *mySettings =
    [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
//    The first time an app calls the registerUserNotificationSettings: method, iOS prompts the
//    user to allow
//    the specified interactions. On subsequent launches, calling this method does not prompt the user.
//    The user can change the notification settings for your app at any time using the Settings app. Because
//    settings can change, always call the registerUserNotificationSettings: at launch time and use the
//    application:didRegisterUserNotificationSettings: method to get the response.
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    NSLog(@"In application:didRegisterUserNotificationSettings:");
}

//If your app is already in the foreground, iOS does not show the notification. Instead, to handle the
//default action, it calls one of the UIApplicationDelegate methods application:didReceiveLocalNotification:
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"application:didReceiveLocalNotification:");
    
    SeeNFDetailsViewController* vc = [[SeeNFDetailsViewController alloc] init];
    self.window.rootViewController = vc;
}

- (void)application:(UIApplication *) application handleActionWithIdentifier: (NSString *) identifier
    forLocalNotification: (NSDictionary *) notification
    completionHandler: (void (^)()) completionHandler {
    // Must be called when finished
    completionHandler();
}

@end
