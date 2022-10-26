//
//  MainTabBarViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 08/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .purple
        
        self.tabBar.tintColor = .white
        self.generateTabbar()

        
    }
    

  
    func generateTabbar(){
        let tabbarVC = UITabBarController()
//        tabbarVC.tabBar.tintColor = .red // titleini rangi
        tabbarVC.tabBarItem.badgeColor = .red
        let vc1 = ContactsViewController()
       
        let nav1 = templateNavigationControllers(rootviewcontroller: vc1, title: "Contacts", image: UIImage(named: "contacts"))

        let vc2 = FavouritosViewController()
        let nav2 = templateNavigationControllers(rootviewcontroller: vc2, title: "Favouritos", image: UIImage(named: "favoritus"))

        let vc3 = KlaviaturaViewController()
        let nav3 = templateNavigationControllers(rootviewcontroller: vc3, title: "Klaviatura", image: UIImage(named: "keyboard"))

        let vc4 = AutoLayoutViewController()
        let nav4 = templateNavigationControllers(rootviewcontroller: vc4, title: "AutoLayots", image: UIImage(named: "favoritus"))
        
        viewControllers = [nav1,nav2,nav3,nav4]
    }
    func templateNavigationControllers(rootviewcontroller:UIViewController,title:String,image: UIImage?)-> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootviewcontroller)
        
        nav.tabBarItem.image = image
        nav.title = title
        if #available(iOS 13.0, *) {
            nav.navigationBar.standardAppearance = UINavigationBarAppearance()
            nav.navigationBar.compactAppearance = UINavigationBarAppearance()
            nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        }
        return nav
       
    }

}
