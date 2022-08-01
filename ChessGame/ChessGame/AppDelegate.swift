//
//  AppDelegate.swift
//  ChessGame
//
//  Created by Bobomurod Ergashev on 31/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UINavigationController(rootViewController: BoardViewController())
        return true
    }



}

