//
//  LeftMenuControllerViewController.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 18/09/22.
//

import UIKit
import Lottie
//import AKSideMenu
let windowwidth = UIScreen.main.bounds.width
class LeftMenuControllerViewController: UIViewController {

    var topView : UIView!
    var animation : AnimationView!
    var collectionView : UICollectionView!
    var layout : UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.initviews()

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func initviews(){
        topView = UIView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: 100))
        topView.backgroundColor = .gray
        view.addSubview(topView)
        
        let buttonHeight : CGFloat = 30
        let menuButton = UIButton(frame: CGRect(x: 16, y: 50, width: buttonHeight, height: buttonHeight))
        menuButton.setImage(UIImage(named: "leftmenu"), for: .normal)
        menuButton.backgroundColor = .clear
        menuButton.addTarget(self, action: #selector(onMenuTap(_:)), for: .touchUpInside)
        topView.addSubview(menuButton)
        
        
//
//        self.animation = AnimationView(name: "lowinternet")
//        self.animation.frame = CGRect(x: 0, y: topView.frame.maxY, width: windowwidth, height: view.frame.height - topView.frame.height)
//        self.animation.loopMode = .loop
//        self.animation.play()
//        view.addSubview(self.animation)


        self.layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 30, left: 10, bottom: 10, right: 10)
//        layout.collectionView?.backgroundColor = .yellow
        self.collectionView = UICollectionView(frame: CGRect(x: 10, y: topView.frame.maxY+5, width: windowwidth-20, height: self.view.frame.height - self.topView.frame.height), collectionViewLayout: layout)
//        collectionView.backgroundColor = .yellow
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        self.collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        self.collectionView.register(FooterCollectionResuableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterCollectionResuableView")
        self.view.addSubview(collectionView)
        
        
    }

    
    @objc func onMenuTap(_ sender: UIButton){
        print("tapped")
        sideMenuViewController?.presentLeftMenuViewController()
    }
    

}
