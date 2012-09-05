//
//  AppDelegate.m
//  ExampleRefresh
//
//  Created by Arthur Ariel Sabintsev on 2/14/12.
//  Copyright (c) 2012 ArtSabintsev. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleTableViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) ExampleTableViewController *timeTableViewController;
@property (strong, nonatomic) ExampleTableViewController *numberTableViewController;


@end
@implementation AppDelegate

@synthesize window = _window;
@synthesize timeTableViewController = _timeTableViewController;
@synthesize numberTableViewController = _numberTableViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create viewController for tabBarController
    self.timeTableViewController = [[ExampleTableViewController alloc] initWithStyle:UITableViewStylePlain andTableViewManagerType:TableViewManagerType_TimeTable];
    UINavigationController *timeNavigationController = [[UINavigationController alloc] initWithRootViewController:self.timeTableViewController];
    
    self.numberTableViewController = [[ExampleTableViewController alloc] initWithStyle:UITableViewStylePlain andTableViewManagerType:TableViewManagerType_NumberTable];
    UINavigationController *numberNavigationController = [[UINavigationController alloc] initWithRootViewController:self.numberTableViewController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:[NSArray arrayWithObjects:timeNavigationController, numberNavigationController, nil]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end