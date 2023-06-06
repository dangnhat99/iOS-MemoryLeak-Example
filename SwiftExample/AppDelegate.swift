//
//  AppDelegate.swift
//  SwiftExample
//
//  Created by Minh Nhat on 04/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setRootView()
        return true
    }
    
    private func setRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = UINavigationController(rootViewController: MainVC())
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

