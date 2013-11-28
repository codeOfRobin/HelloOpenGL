//
//  XYZAppDelegate.m
//  HelloOpenGL
//
//  Created by Robin Malhotra on 20/10/13.
//  Copyright (c) 2013 Robin's code kitchen. All rights reserved.
//

#import "XYZAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation XYZAppDelegate
{
    BOOL _increase;
    float _curred;
    float _x;
    float _y;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    EAGLContext *context=[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView *view=[[GLKView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    view.context=context;
    view.delegate=self;
    
    _increase=YES;
    _curred=0.0;
    _x=0.0;
    _y=0.0;
    
    
    GLKViewController *viewcontroller=[[GLKViewController alloc]initWithNibName:nil bundle:nil];
    viewcontroller.preferredFramesPerSecond=60;
    viewcontroller.view=view;
    viewcontroller.delegate=self;
    self.window.rootViewController=viewcontroller;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
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

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    glClearColor(_curred,_x,_y , 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
}

#pragma mark - GLKViewControllerDelegate

- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    if (_increase) {
        _curred += 0.5 * controller.timeSinceLastUpdate;
        _x+=0.3*controller.timeSinceLastUpdate;
        _y+=0.2*controller.timeSinceLastUpdate;
    } else {
        _curred -= 0.5 * controller.timeSinceLastUpdate;
    }
    if (_curred >= 1.0) {
        _curred = 1.0;
        _x=1.0;
        _y=1.0;
        _increase = NO;
    }
    if (_curred <= 0.0) {
        _curred = 0.0;
        _x=0.0;
        _y=0.0;
        _increase = YES;
    }
}
@end
