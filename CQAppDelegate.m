//
//  CQAppDelegate.m
//  AppOne
//
//  Created by mar Jinn on 1/13/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQAppDelegate.h"

#import "CQPerson.h"
#import "CQViewController.h"

#import "CQSecondViewController.h"

#import "CQTableViewController.h"

@implementation CQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    /*Initialize Person Class
     */
     CQPerson* person;
     person = [[CQPerson alloc]init];
    
    //set First name
    [person setFirstName:@"Steve"];
    
    //set last name
    [person setLastname:@"Jobs" ];
    
    [person setCurrentHeight:175.0f];/* Centimeters */
    
    if ([person currentHeight] >=
        [CQPerson minimumHeightInCentimeters] &&
        [person currentHeight] <=
        [CQPerson maximumHeightInCentimeters])
    {
        /* The height of this particular
            person is in acceptable range
         */
    }
         else
         {
             /* 
              This person's height is not
              in acceptable range
              */
         }
    
    //Call Methods
    [person walkAtKilometersPerHour:3.0f];
    [person runAt10KilometersPerhour];
    
    //Release CQPerson
    /*[person release]; non-ARC*/
    
    
    /*
     Needed only if the project is of type - empty
     Adding UIwindow to avoid Storyboard
    */
    [self setWindow:[[UIWindow alloc]initWithFrame:
                     [[UIScreen mainScreen]bounds]]];
    
    //add window background color
    [[self window]setBackgroundColor:[UIColor whiteColor]];
    
    
    /*
     * Add navigationController
     */
    
    
    
    //[[self window]addSubview:[primaryVWC view]];
    
    //Step required
    //if UI components are added to the view controller class
    //Also ..all windows are expected to have a root view controller 
    //[[self window]setRootViewController:primaryVWC];
    
  
     
     //Add View Controller as subView of the window
     CQViewController* primaryVWC;
     primaryVWC = [[CQViewController alloc]init];
     
    [self setNavigationController:[[UINavigationController alloc]initWithRootViewController:primaryVWC]];
//    
//    [[self window]setRootViewController:
//     (UIViewController *)[self navigationController]];
    
    
    
    CQSecondViewController* secondVC;
    secondVC = [[CQSecondViewController alloc]initWithNibName:nil
                                                       bundle:NULL];
    
    
    
    UINavigationController *secondNavigationController =
    [[UINavigationController alloc]
     initWithRootViewController:secondVC];
    
    
    CQTableViewController* tbl ;
    tbl = [[CQTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    
    
    UINavigationController *thirdNavigationController =
    [[UINavigationController alloc]
     initWithRootViewController:tbl];
    
    
    /* Create tab bar */
    UITabBarController* tabBarC;
    tabBarC = [[UITabBarController alloc]init];
    
    [tabBarC setViewControllers:@[[self navigationController],secondNavigationController,thirdNavigationController]
                       animated:YES];
    
    
    
    [[self window]setRootViewController:(UIViewController *)tabBarC];
    
    //make window visible
    [[self window]makeKeyAndVisible];
    
     
    
    
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
