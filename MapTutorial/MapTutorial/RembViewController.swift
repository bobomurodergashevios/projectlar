//
//  RembViewController.swift
//  MapTutorial
//
//  Created by Bobomurod Ergashev on 23/10/22.
//

import UIKit

class RembViewController: UIViewController {
    
    private var layout : UICollectionViewFlowLayout!
    private var collview : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.initviews()
    }
    

    func initviews(){
        self.layout = UICollectionViewFlowLayout()
        self.layout.scrollDirection = .vertical
        self.layout.sectionInset = .init(top: 10, left: 1, bottom: 10, right: 1)
        self.collview = UICollectionView(frame: CGRect(x: 20, y: 50, width: view.frame.width-40, height: view.frame.height-40), collectionViewLayout: layout)
        collview.delegate = self
        collview.dataSource = self
        collview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
      
        view.addSubview(collview)
        
        
        
        
        
        
     
    }

}

extension RembViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collview.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize : CGFloat = collview.frame.width/3-1
        return CGSize(width: itemsize, height: itemsize)

    }
}
