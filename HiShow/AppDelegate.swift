//
//  AppDelegate.swift
//  HiShow
//
//  Created by Damin on 16/9/21.
//  Copyright © 2016年 cgm. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    var performanceView: GDPerformanceMonitor?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        application.statusBarStyle = UIStatusBarStyle.lightContent
//        UINavigationBar.appearance().barTintColor = UIColor.black
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        setNavBarAppearence()
        
        #if DEBUG
            GDPerformanceMonitor.sharedInstance.startMonitoring()
            GDPerformanceMonitor.sharedInstance.appVersionHidden = true
            GDPerformanceMonitor.sharedInstance.deviceVersionHidden = true
            GDPerformanceMonitor.sharedInstance.configure(configuration: { (textLabel) in
                textLabel?.backgroundColor = .black
                textLabel?.textColor = .white
                textLabel?.layer.borderColor = UIColor.black.cgColor
            })
        #endif
        
        return true
    }
    
    func setNavBarAppearence() {
        // 设置导航栏默认的背景颜色
//        WRNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1)
        WRNavigationBar.defaultNavBarBarTintColor = .black
        // 设置导航栏所有按钮的默认颜色
        WRNavigationBar.defaultNavBarTintColor = .white
        // 设置导航栏标题默认颜色
        WRNavigationBar.defaultNavBarTitleColor = .white
        // 统一设置状态栏样式
        WRNavigationBar.defaultStatusBarStyle = .lightContent
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        WRNavigationBar.defaultShadowImageHidden = false
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        #if DEBUG
            GDPerformanceMonitor.sharedInstance.stopMonitoring()
        #endif
    }
}
