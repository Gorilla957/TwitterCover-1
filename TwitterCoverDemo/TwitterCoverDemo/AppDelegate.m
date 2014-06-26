//
//  AppDelegate.m
//  TwitterCoverDemo
//
//  Created by XuDong Jin on 14-6-26.
//  Copyright (c) 2014年 XuDong Jin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ViewController *ctrl = [[ViewController alloc] init];
    self.window.rootViewController = ctrl;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
