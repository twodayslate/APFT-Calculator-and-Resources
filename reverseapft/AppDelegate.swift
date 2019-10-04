//
//  AppDelegate.swift
//  reverseapft
//
//  Created by twodayslate on 10/14/14.
//  Copyright (c) 2014 twodayslate. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		
		printd("inside application")
		
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0, *) {
            self.window?.backgroundColor = UIColor.black
        } else {
            self.window?.backgroundColor = .white
        }
        
        let nav = SRCTabBarController()
        nav.delegate = nav
        
        let calc = CalcViewController()
        calc.tabBarItem = UITabBarItem(title: "Calculator", image: UIImage(named: "calc"), tag: 0)
        
        let revCalc = ReverseCalcViewController()
        revCalc.tabBarItem = UITabBarItem(title: "Reverse Calculator", image: UIImage(named: "rev"), tag: 1)
        
        let docs = DocNavigationController()
        docs.tabBarItem = UITabBarItem(title: "Documents", image: UIImage(named: "docs"), tag: 2)
        
        let acftLink = UIViewController()
        acftLink.tabBarItem = UITabBarItem(title: "ACFT", image: UIImage(named: "star"), tag: 666)
        
        let instructions = InstructionsViewController()
        instructions.tabBarItem = UITabBarItem(title: "Instructions", image: UIImage(named: "manual"), tag: 3)
        
        nav.viewControllers = [calc, revCalc, instructions, docs, acftLink]
        
        self.window!.rootViewController = nav
        
        self.window!.makeKeyAndVisible()
        
        self.update_preferences()
        
        return true
    }

    func update_preferences() {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(version + "-" + build, forKey: "version")
    }
    
	func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

	func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

	func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

	func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

	func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

