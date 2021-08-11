//
//  AppDelegate.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 10/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let userView = UserListRouter.create()
        window.rootViewController = UINavigationController(rootViewController: userView)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

