//
//  UIColViewController.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 22/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        let vc1 = CollectioonViewController()
        let vc2 = TableviewControllerTableViewController()
        let vc3 = CollectionViewController2()
        let vc4 = CustomCollectionViewController()
        var nav1 = templatenavigationcontrollers(rootviewcontroller: vc1, title: "nav1", image: UIImage(named: "icon1"))
        var nav2 = templatenavigationcontrollers(rootviewcontroller: vc2, title: "nav2", image: UIImage(named: "icon2"))
        var nav3 = templatenavigationcontrollers(rootviewcontroller: vc3, title: "CollectionViewController2", image: UIImage(named: "icon1"))
        var nav4 = templatenavigationcontrollers(rootviewcontroller: vc4, title: "nav4", image: UIImage(named: "icon2"))
        viewControllers = [nav1,nav2,nav3,nav4]

    }
    
    
    func templatenavigationcontrollers(rootviewcontroller: UIViewController,title: String,image: UIImage?) -> UINavigationController{
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
