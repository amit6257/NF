//
//  ViewController.m
//  Thoughts
//
//  Created by AMIT AGARWAL on 7/13/16.
//  Copyright © 2016 AMIT AGARWAL. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // local notification while app is open
    UIButton* showLocalNotification = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 200, 50)];
    [showLocalNotification setTitle:@"notify me now" forState:UIControlStateNormal];
    showLocalNotification.backgroundColor = [UIColor blueColor];
    
    [showLocalNotification addTarget:self action:@selector(showLocalNotifications) forControlEvents:UIControlEventTouchUpInside];
    
    //local schedules notification
    UIButton* scheduledNotification = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 200, 50)];
    [scheduledNotification setTitle:@"notify me later" forState:UIControlStateNormal];
    scheduledNotification.backgroundColor = [UIColor redColor];
    [scheduledNotification addTarget:self action:@selector(showScheduledLocalNotification) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:showLocalNotification];
    [self.view addSubview:scheduledNotification];
}

// If your app is already in the foreground, iOS does not show the notification.
// application:didReceiveLocalNotification: is called
- (void)showLocalNotifications {
    //Defining a category of actions for a local notification
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //    notification.fireDate =
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.category = @"INVITE_CATEGORY";
    notification.alertBody = @"hello world!!";
    notification.alertTitle = @"hello title";
    notification.alertAction = @"hello action";
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

//Instead, to handle the default action, it calls one of the UIApplicationDelegate methods
//application:didReceiveLocalNotification:
- (void)showScheduledLocalNotification {
    // Allocate and initialize a UILocalNotification object.
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.category = @"INVITE_CATEGORY";
    notification.alertBody = @"hello world!!";
    notification.alertTitle = @"hello title";
    notification.alertAction = @"hello action";
    
//    Set the date and time that the operating system should deliver the notification. This is the fireDate
//    property.
//    If you set the timeZone property to the NSTimeZone object for the current locale, the system
//    automatically adjusts the fire date when the device travels across (and is reset for) different
//    time zones.
    notification.fireDate = [self getDateNSecondsFromNow:4];
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

-(NSDate*) getDateNSecondsFromNow:(int) N {
    return [NSDate dateWithTimeIntervalSinceNow:N];
}

@end
