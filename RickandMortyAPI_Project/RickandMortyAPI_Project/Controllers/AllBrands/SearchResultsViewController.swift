//
//  SearchResultsViewController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 08/10/22.
//

import UIKit

class SearchResultsViewController: UIViewController {
    private var layout = UICollectionViewFlowLayout()
    var datalist = [String]()
    private var collectionVC : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
    }
    


    
    public func update(_ data : [String]){
        initCollectionVC()
        datalist = data
    }
    
    
    func initCollectionVC(){
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.sectionInset = .init(top: 10, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionVC = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVC.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionVC.delegate = self
        collectionVC.dataSource = self
        self.view.addSubview(collectionVC)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionVC.frame = view.bounds
    }
}


extension SearchResultsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datalist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        for superview in cell.contentView.subviews{
            superview.removeFromSuperview()
        }
        cell.backgroundColor = .red
        let lbl = UILabel(frame: CGRect(x: 5, y: 5, width: cell.frame.width-10, height: cell.frame.height-10))
        lbl.text = datalist[indexPath.row]
        cell.contentView.addSubview(lbl)
        return cell
    }
}
