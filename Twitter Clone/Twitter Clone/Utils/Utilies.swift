//
//  Utilies.swift
//  Twitter Clone
//
//  Created by Bobomurod Ergashev on 25/08/22.
//

import UIKit

class Utilies {
    
    func inputContaionerView(withImage image: UIImage, textField : UITextField)->UIView{
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let iv = UIImageView()
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft:8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: iv.bottomAnchor, right: iv.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        return view
    }
}
