//
//  AppDelegate.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "AppDelegate.h"
#import "QQNavgationViewController.h"
#import "QQViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initWindow];
    return YES;
}

- (void)initWindow{
    self.window = [[UIWindow alloc]initWithFrame:QQScreenF];
    self.window.backgroundColor = [UIColor whiteColor];
    QQNavgationViewController *nav = [[QQNavgationViewController alloc]initWithRootViewController:[[QQViewController alloc]init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

}




@end
