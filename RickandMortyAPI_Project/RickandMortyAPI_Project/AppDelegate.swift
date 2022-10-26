//
//  AppDelegate.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 05/10/22.
//

import UIKit
import AKSideMenu
import GoogleMaps
let windowwidth : CGFloat = UIScreen.main.bounds.width

let appdelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AKSideMenuDelegate {


    var navigationController : UINavigationController!

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey("AIzaSyAxbPtQosk3slfwpno7PIq6c2CEbVHstaM")
        self.route(destionation: .main)

        return true
    }

    
    func configureSideMenu() {
        let sideMenu = AKSideMenu(contentViewController: MainController(), leftMenuViewController: LeftMenuViewController(), rightMenuViewController: nil)
        sideMenu.delegate = self
        sideMenu.contentViewShadowEnabled = true
        sideMenu.scaleContentView = false
        sideMenu.contentViewShadowColor = UIColor.black
        sideMenu.contentViewShadowOffset = CGSize(width: 0, height: 0)
        sideMenu.contentViewShadowRadius = 5
        sideMenu.contentViewShadowOpacity = 0.9
        sideMenu.scaleMenuView = true
        sideMenu.scaleBackgroundImageView = true
        sideMenu.contentViewInPortraitOffsetCenterX = 120
        window?.rootViewController = UINavigationController(rootViewController: sideMenu)
        
    }
    
    
    
    func route(destionation : ApplicationRoute){
        
        switch destionation {
        case .main:
            self.configureSideMenu()
        case .login:
            self.navigationController = UINavigationController(rootViewController: SignINViewController())
            window?.rootViewController = navigationController
        case .lostInternet:
            break
        }
       
    }
    
    
  
}

enum ApplicationRoute{
    case main
    case login
    case lostInternet
}
