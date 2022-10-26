//
//  AppDelegate.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController =  MainTabbarVCViewController()
        return true
    }

  


}

