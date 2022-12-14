//
//  AppDelegate.swift
//  NeoStore
//
//  Created by webwerks on 18/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var loginView: LoginView!
    var homeView: HomeView!
    
    var passwordItems = [KeychainPasswordItem]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        window = UIWindow(frame: UIScreen.main.bounds)
        loginView = LoginView()
        homeView = HomeView()
        
        let navController = NavigationController(rootViewController: homeView)
        
        do {
            passwordItems = try KeychainPasswordItem.passwordItems(forService: KeychainConfiguration.serviceName, accessGroup: KeychainConfiguration.accessGroup)
            if passwordItems.count != 0 {
                let password = try passwordItems[0].readPassword()
                print(password)
                APIConstants.token = password
                window?.rootViewController = navController
            } else {
                window?.rootViewController = loginView
            }
            
        }
        catch {
            window?.rootViewController = loginView
            print("Error fetching password items - \(error)")
        }
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }

    
}

