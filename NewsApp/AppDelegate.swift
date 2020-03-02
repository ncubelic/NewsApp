//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Nikola on 2.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appFlowController = AppFlowController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = appFlowController
        window.makeKeyAndVisible()
        
        return true
    }


}

