//
//  AppDelegate.swift
//  MapTutorial
//
//  Created by Bobomurod Ergashev on 11/10/22.
//

import UIKit
import GoogleMaps
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        GMSServices.provideAPIKey("AIzaSyBiVl0Qw2mzAsPI4PSaXiepSE_S7hBGnjE")
        window?.rootViewController = RembViewController()
        return true
    }


}

