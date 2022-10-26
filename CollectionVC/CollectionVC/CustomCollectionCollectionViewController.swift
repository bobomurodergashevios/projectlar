//
//  CustomCollectionCollectionViewController.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 21/08/22.
//

import UIKit

//private let reuseIdentifier = "CustomCell"

class CustomCollectionCollectionViewController: UICollectionViewCell {
    static let identifier = "CustomCollectionCollectionViewController"
   
    func initCollectionViewCell(frame: CGRect,model: Model){
        for subs in self.contentView.subviews{
            subs.removeFromSuperview()
        }
        self.backgroundColor = .white
        let imageview = UIImageView()
        
        imageview.pin_setImage(from: URL(string: model.image))
        imageview.frame = frame
        imageview.contentMode = .scaleToFill
        contentView.addSubview(imageview)
       
        
       
        
    }
}
