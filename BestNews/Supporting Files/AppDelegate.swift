//
//  AppDelegate.swift
//  BestNews
//
//  Created by Assil Heddar on 20/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DependencyProvider.headLinesVC
        window?.makeKeyAndVisible()
        return true
    }
}


