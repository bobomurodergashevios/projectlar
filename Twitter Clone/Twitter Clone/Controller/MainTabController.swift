//
//  MainTabController.swift
//  Twitter Clone
//
//  Created by Bobomurod Ergashev on 02/08/22.
//

import UIKit

class MainTabController: UITabBarController {

    //MARK: Properties
    private lazy var actionButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "new_tweet"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
//        self.view.backgroundColor = .red
        self.configureViewControllers()
        configureUI()
    }
    
    // MARK: Selectors
    @objc func actionButtonTapped() {
        print(123)
    }
    
    // MARK: Configure UI
    
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 28
        
    }
    func configureViewControllers(){
        
        let vc1 = FeedController()
        vc1.title = "Feed"
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: vc1)
//
        
        let vc2 = ExploreController()
        vc2.title = "Explore"
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: vc2)

        
        let vc3 = NotificationsController()
        vc3.title = "Notification"
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: vc3)
//
        let vc4 = ConversationsController()
            
        vc4.title = "Message"
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: vc4)
//
        
        
        
        
        
        viewControllers = [nav1,nav2,nav3,nav4]
        
        
        
        
    }
    
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .red
        if #available(iOS 13.0, *) {
            nav.navigationBar.standardAppearance = UINavigationBarAppearance()
            nav.navigationBar.compactAppearance = UINavigationBarAppearance()
            nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        }
        return nav
    }
   
}
