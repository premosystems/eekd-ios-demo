//
//  CDAppDelegate.m
//  Cheekd
//
//  Created by Vincil Bishop on 7/8/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "CDAppDelegate.h"
#import "CDMeteorClient.h"

#define kMeteorURL @"ws://localhost:3000/websocket" // development
//#define kMeteorURL @"" // public

@implementation CDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CDMeteorClient sharedClient].ddp = [[ObjectiveDDP alloc] initWithURLString:kMeteorURL delegate:[CDMeteorClient sharedClient]];
    [[CDMeteorClient sharedClient].ddp connectWebSocket];
    
    NSLog(@"FacebookAppID:%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"FacebookAppID"]);
    [FBSettings setLoggingBehavior:[NSSet setWithObject:FBLoggingBehaviorAccessTokens]];
    // FacebookAppID is set through a user defined build setting specific to the build configuration.
    [FBSettings setDefaultAppID:[NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"FacebookAppID"]]];
    
    [FBSettings setAppVersion:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];

    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    
    UIViewController *viewController = [storyBoard instantiateInitialViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = viewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
