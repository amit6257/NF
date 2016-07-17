//
//  SeeNFDetailsViewController.m
//  Thoughts
//
//  Created by AMIT AGARWAL on 7/16/16.
//  Copyright © 2016 AMIT AGARWAL. All rights reserved.
//

#import "SeeNFDetailsViewController.h"

@interface SeeNFDetailsViewController ()

@end

@implementation SeeNFDetailsViewController {
    UITextView* tv;
    UILabel* labelBody;
    NSString* labelBodyText;
    NSString* textViewText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    tv = [[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 300) textContainer:nil];
    
    labelBody = [[UILabel alloc]initWithFrame:CGRectMake(10, 400, 300, 100)];
    labelBody.text= labelBodyText;
    labelBody.backgroundColor = [UIColor lightGrayColor];
    tv.backgroundColor = [UIColor lightGrayColor];
    tv.text = textViewText;
    
    [self.view addSubview:tv];
    [self.view addSubview:labelBody];
}

- (void)setNFData : (UILocalNotification*) notification {
    labelBodyText = notification.alertTitle;
    textViewText = notification.alertBody;
    NSLog(@"data = %@", notification.alertBody);
}

@end
