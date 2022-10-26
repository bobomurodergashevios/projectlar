//
//  AppDelegate.swift
//  Islom
//
//  Created by Bobomurod Ergashev on 12/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainVC()
        window?.makeKeyAndVisible()
        return true
    }

}

