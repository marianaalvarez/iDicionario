//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"
#import "LetraViewController.h"
#import "TableViewController.h"

@implementation MackenzieAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    LetraViewController *viewController = [[LetraViewController alloc]
                                           initWithNibName:nil
                                           bundle:nil];
    
    
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:viewController];
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TableViewController *tableVC = [[TableViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    tabBarController.viewControllers = @[self.navigationController, tableVC];
    
    [[tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Dicionario"];
    [[tabBarController.tabBar.items objectAtIndex:1] setTitle:@"Lista"];
    
    [[tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"literature-25"]];
    [[tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"list-26"]];
    
    //self.navigationController.toolbarHidden = NO;

    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
