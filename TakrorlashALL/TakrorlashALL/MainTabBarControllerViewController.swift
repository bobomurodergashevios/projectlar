//
//  MainTabBarControllerViewController.swift
//  TakrorlashALL
//
//  Created by Bobomurod Ergashev on 23/10/22.

import UIKit
import Foundation
class MTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .cyan
        tabBar.backgroundColor = .white
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
        tabBar.layer.shadowRadius = 1.09
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.1
        let vc1 = TranslateViewController()
        let nav1 = templateNavigationControllers(rootviewcontroller: vc1, title: "Translate", image: UIImage(named:"dikt"))
        
        let vc2 = TranslateViewController()
        let nav2 = templateNavigationControllers(rootviewcontroller: vc2, title: "Favorites", image: UIImage(named: "zvezda"))
        
        let vc3 = TranslateViewController()
        let nav3 = templateNavigationControllers(rootviewcontroller: vc3, title: "History", image: UIImage(named: "clock"))
        
        let vc4 = TranslateViewController()
        let nav4 = templateNavigationControllers(rootviewcontroller: vc4, title: "Profile", image: UIImage(named: "male"))
       
        
        
        viewControllers = [nav1,nav2,nav3,nav4]
        
        
        
    }
    
    
    func templateNavigationControllers(rootviewcontroller : UIViewController, title : String , image : UIImage?) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootviewcontroller)
        nav.title = title
        nav.tabBarItem.image = image
        
        
        
        if #available(iOS 13.0, *) {
                    nav.navigationBar.standardAppearance = UINavigationBarAppearance()
                    nav.navigationBar.compactAppearance = UINavigationBarAppearance()
                    nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
                }
        
        return nav
        
    }

}

//extension MainTabBarController : UITabBarDelegate {
//
//}
