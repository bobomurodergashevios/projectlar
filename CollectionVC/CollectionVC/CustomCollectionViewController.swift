//  CustomCollectionViewController.swift
//  CollectionVC
//  Created by Bobomurod Ergashev on 22/08/22.


import UIKit

class CustomCollectionViewController: UIViewController {
    
    private var collection : UICollectionView!
    private let layout = UICollectionViewFlowLayout()
    private var modelarr = [Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model(),
                            Model()
                            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        self.view.addSubview(collection)

    }
    

}



extension CustomCollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.initviews(frame: CGRect(x: 5, y: 5, width: windowWidth/4 - 150, height: windowWidth/4 - 150), model: modelarr[indexPath.row] )
        cell.backgroundColor = .blue
        return cell
        
    }
}
extension CustomCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize : CGFloat = windowWidth/3 - 10
        return CGSize(width: itemsize, height: itemsize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 70
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


