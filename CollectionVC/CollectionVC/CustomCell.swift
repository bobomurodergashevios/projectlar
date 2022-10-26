//
//  CustomCell.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 22/08/22.
//

import UIKit



class CustomCell : UICollectionViewCell{
    
    var model : Model!
    
    
    
    func initviews(frame: CGRect,model : Model){
//        self.backgroundColor = .red
        self.model = model
        for subs in self.contentView.subviews{
            subs.removeFromSuperview()
        }
        
        let image = UIImageView(frame: CGRect(x: 20, y: 20, width: self.frame.width - 40, height: self.frame.height - 40))
        
        image.pin_setImage(from: URL(string: self.model.image))
        contentView.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 10, y: image.frame.maxY + 1, width: 30, height: 20))
        label.text = "korieie wew"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 10)
        contentView.addSubview(label)
        
        
        
        
//        self.addSubview(contentView)
        
        
        
    }
    
}
