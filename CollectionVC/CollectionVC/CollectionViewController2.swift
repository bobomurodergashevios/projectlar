//
//  CollectionViewController2.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 22/08/22.
//

import UIKit

class CollectionViewController2: UIViewController {

    private var collection : UICollectionView!
    private var layout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.scrollDirection = .vertical
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        view.addSubview(collection)
        
    }
    

}

extension CollectionViewController2 : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as! UICollectionViewCell
        
        cell.backgroundColor = .red
        return cell
        
    }
}
extension CollectionViewController2 : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize: CGFloat = windowWidth / 3 - 15
        return CGSize(width: itemsize, height: itemsize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
