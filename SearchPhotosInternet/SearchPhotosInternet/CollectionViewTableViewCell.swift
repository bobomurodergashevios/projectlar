//
//  CollectionViewTableViewCell.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    static let identifier = "CollectionViewTableViewCell"
    private var collectionVw : UICollectionView!
    private var imgview : UIImageView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initTableViewCell()
        DispatchQueue.main.async {
            self.collectionVw.reloadData()
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initTableViewCell(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

         collectionVw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVw.isScrollEnabled = false
        collectionVw.register(UICollectionTableVCellCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionTableVCellCollectionViewCell")
        collectionVw.delegate = self
        collectionVw.dataSource = self
        collectionVw.frame = CGRect(x: 0, y: 0, width: contentView.frame.width+40, height: 100)
        layout.sectionInset = .init(top: 10, left: 6, bottom: 10, right: 0)
        collectionVw.backgroundColor = .cyan.withAlphaComponent(0.2)
        contentView.addSubview(collectionVw)
       
        
        
    }
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionTableVCellCollectionViewCell.identifier, for: indexPath) as? UICollectionTableVCellCollectionViewCell else {
            return UICollectionViewCell()
        }
       
//        cell.updatingAllProps(data: modellist[0].weather?[0].icon ?? "")
        cell.backgroundColor = .white.withAlphaComponent(0.3)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (contentView.frame.width - 60) / 6 , height: contentView.frame.height - 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
