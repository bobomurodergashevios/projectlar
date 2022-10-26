//
//  MainController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 07/10/22.
//

import UIKit

class MainController: UIViewController {

    var topView : UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        initviews()
    }
    // bir controllerdan ikkinchi controllerga utib qaytishda ishlaydi
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func initviews(){
        topView = UIView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: 100))
        topView.backgroundColor = .gray
        view.addSubview(topView)
        
        let buttonHeight : CGFloat = 30
        let menuButton = UIButton(frame: CGRect(x: 16, y: 50, width: buttonHeight, height: buttonHeight))
        if #available(iOS 13.0, *) {
            menuButton.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        menuButton.backgroundColor = .clear
        menuButton.addTarget(self, action: #selector(onMenuTap(_:)), for: .touchUpInside)
        topView.addSubview(menuButton)
    }
    

    
    @objc func onMenuTap(_ sender: UIButton){
        sideMenuViewController?.presentLeftMenuViewController()
    }
}
