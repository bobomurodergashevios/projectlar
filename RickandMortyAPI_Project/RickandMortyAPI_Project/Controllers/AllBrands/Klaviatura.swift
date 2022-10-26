//
//  Klaviatura.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 08/10/22.
//

import Foundation
import UIKit

class KeyboardView : UIView, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    private var keylist : [String] = [String]()
    private var klaviaturacollVC : UICollectionView!
    private var layoutkl = UICollectionViewFlowLayout()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        keylist = [
           "All","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","W","X","Y","Z","V","123"
        ]
        self.initviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initviews(){
        layoutkl.scrollDirection = . vertical
        layoutkl.minimumLineSpacing = 3
        layoutkl.minimumInteritemSpacing = 3
//        layoutkl.sectionInset = .init(top: 50, left: 5, bottom: 50, right: 10)
        klaviaturacollVC = UICollectionView(frame: .zero, collectionViewLayout: layoutkl)
        klaviaturacollVC.frame = self.bounds
//        klaviaturacollVC.isScrollEnabled = false
        klaviaturacollVC.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        klaviaturacollVC.delegate = self
        klaviaturacollVC.dataSource = self
        self.addSubview(klaviaturacollVC)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .gray
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        let lbl = UILabel(frame: CGRect(x: 2, y: 2, width: cell.frame.width-4, height: cell.frame.height-4))
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.text = keylist[indexPath.row]
        cell.contentView.addSubview(lbl)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 40)
    }
    
}

