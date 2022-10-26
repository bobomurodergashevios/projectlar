//
//  MainTabbarVCViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

class MainTabbarVCViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .white
//        self.tabBar.backgroundColor = .white

        // 16.09
        self.initviews()

    }
    
    func initviews(){
        let vc1 = HomeViewController()
        vc1.title = "home"
        let nav1 = templatenavigationNavigationController(rootviewcontroller: vc1, title: "Home", image: UIImage(named: "home"))
        let vc2 = ComingSoonViewController()
        vc2.title = "coming soon"
        let nav2 = templatenavigationNavigationController(rootviewcontroller: vc2, title: "Coming soon", image: UIImage(named: "comingson"))
        let vc3 = SearchViewController()
        vc3.title = "search"
        let nav3 = templatenavigationNavigationController(rootviewcontroller: vc3, title: "Search", image: UIImage(named: "search"))
        let vc4 = DownloadViewController()
        vc4.title = "download"
        let nav4 = templatenavigationNavigationController(rootviewcontroller: vc4, title: "Download", image: UIImage(named: "download"))
        
        

        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
        
    }
    
    
    
    func templatenavigationNavigationController(rootviewcontroller : UIViewController , title : String , image: UIImage? )->UIViewController{
        
        let nav = UINavigationController(rootViewController: rootviewcontroller)
        
        nav.tabBarItem.image = image
//        nav.navigationBar.tintColor = .blu/e
        tabBarItem.title = title
        if #available(iOS 13.0, *) {
            nav.navigationBar.standardAppearance = UINavigationBarAppearance()
            nav.navigationBar.compactAppearance = UINavigationBarAppearance()
            nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        }
        return nav
        
        
    }
}
